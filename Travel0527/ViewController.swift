//
//  ViewController.swift
//  Travel0527
//
//  Created by J Oh on 5/27/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let list = TravelInfo.travel
    var filteredList: [Travel] = []
    
    @IBOutlet var travelTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "도시 상세 정보"
        
        filteredList = list
        travelTableView.delegate = self
        travelTableView.dataSource = self
        
        let adXib = UINib(nibName: ADTableViewCell.adCellIdentifier, bundle: nil)
        travelTableView.register(adXib, forCellReuseIdentifier: ADTableViewCell.adCellIdentifier)
        
        let xib = UINib(nibName: TravelTableViewCell.travelCellIdentifier, bundle: nil) // XIB 파일 이름
        travelTableView.register(xib, forCellReuseIdentifier: TravelTableViewCell.travelCellIdentifier) // 셀 identifier
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = filteredList[indexPath.row]
        
        if data.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.adCellIdentifier, for: indexPath) as! ADTableViewCell
            cell.configureText(data: data)
            
            let colors: [UIColor] = [.green, .blue, .red, .orange]
            cell.adUIView.backgroundColor = colors.randomElement()?.withAlphaComponent(0.2)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.travelCellIdentifier, for: indexPath) as! TravelTableViewCell
            
            cell.likeButton.tag = indexPath.row
            cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
            cell.configureData(data: data)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = filteredList[indexPath.row]
        return data.ad ? 100 : 130
    }
    
    @objc func likeButtonClicked(sender: UIButton) {
        let tag = sender.tag
        filteredList[tag].like?.toggle()
        travelTableView.reloadRows(at: [IndexPath.SubSequence(row: sender.tag, section: 0)], with: .automatic)
    }

}

