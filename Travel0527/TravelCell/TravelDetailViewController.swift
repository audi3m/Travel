//
//  TravelDetailViewController.swift
//  Travel0527
//
//  Created by J Oh on 5/29/24.
//

import UIKit

class TravelDetailViewController: UIViewController {
    
    static let id = "TravelDetailViewController"
    
    @IBOutlet var travelScreenLabel: UILabel!
    @IBOutlet var popButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "관광지 화면"
        travelScreenLabel.text = "관광지 화면"
        travelScreenLabel.font = .boldSystemFont(ofSize: 30)
        
        popButton.setTitle("Pop", for: .normal)
        
    }
    
    @IBAction func popButtonClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    

}
