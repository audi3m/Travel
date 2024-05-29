//
//  ViewController.swift
//  Travel0527
//
//  Created by J Oh on 5/27/24.
//

import UIKit

class ViewController: UIViewController {
    
    let list = TravelInfo.travel
    var filteredList: [Travel] = []
    
    @IBOutlet var travelTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let xib = UINib(nibName: TravelTableViewCell.identifier, bundle: nil) // XIB 파일 이름
        let adXib = UINib(nibName: ADTableViewCell.identifier, bundle: nil)
        configureTableView(travelXib: xib, adXib: adXib)
    }
    
    @objc func likeButtonClicked(sender: UIButton) {
        let tag = sender.tag
        filteredList[tag].like?.toggle()
        travelTableView.reloadRows(at: [IndexPath.SubSequence(row: sender.tag, section: 0)], with: .automatic)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = filteredList[indexPath.row]
        return data.ad ? 100 : 130
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = filteredList[indexPath.row]
        
        if data.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier, for: indexPath) as! ADTableViewCell
            cell.configureText(data: data)
            
            let colors: [UIColor] = [.green, .blue, .red, .orange]
            cell.adUIView.backgroundColor = colors.randomElement()?.withAlphaComponent(0.2)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.identifier, for: indexPath) as! TravelTableViewCell
            
            cell.likeButton.tag = indexPath.row
            cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
            cell.configureData(data: data)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = list[indexPath.row]
        print(#function)
        
        if data.ad {
            let sb = UIStoryboard(name: "ADDetail", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: ADDetailViewController.id) as! ADDetailViewController
            
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            
            // 3. 화면 띄우기 - 타이틀 나옴. 여전히 present
            present(nav, animated: true)
        } else {
            let sb = UIStoryboard(name: "TravelDetail", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: TravelDetailViewController.id) as! TravelDetailViewController
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        // selection 없애기
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
}


// MARK: TableView Setting
extension ViewController {
    func configureTableView(travelXib: UINib, adXib: UINib) {
        navigationItem.title = "도시 상세 정보"
        
        filteredList = list
        travelTableView.delegate = self
        travelTableView.dataSource = self
        travelTableView.rowHeight = UITableView.automaticDimension
        
        travelTableView.register(travelXib, forCellReuseIdentifier: TravelTableViewCell.identifier) // 셀 identifier
        travelTableView.register(adXib, forCellReuseIdentifier: ADTableViewCell.identifier)
        
    }
}
