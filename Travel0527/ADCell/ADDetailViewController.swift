//
//  ADDetailViewController.swift
//  Travel0527
//
//  Created by J Oh on 5/29/24.
//

import UIKit

class ADDetailViewController: UIViewController {
    
    static let id = "ADDetailViewController"
    
    @IBOutlet var adLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "광고"
        
        adLabel.text = "광고 화면"
        adLabel.font = .boldSystemFont(ofSize: 30)
        
        let dismissButton = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(dismissButtonClicked))
        navigationItem.rightBarButtonItem = dismissButton
        
    }
    
    @objc func dismissButtonClicked() {
        dismiss(animated: true)
    }

}
