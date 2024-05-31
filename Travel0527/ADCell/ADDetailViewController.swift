//
//  ADDetailViewController.swift
//  Travel0527
//
//  Created by J Oh on 5/29/24.
//

import UIKit

class ADDetailViewController: UIViewController {
    
    var data: Travel?
    
    @IBOutlet var adLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIAndData()
        
        let dismissButton = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(dismissButtonClicked))
        navigationItem.rightBarButtonItem = dismissButton
        
    }
    
    func configureUIAndData() {
        navigationItem.title = "광고"
        adLabel.font = .boldSystemFont(ofSize: 24)
        adLabel.textAlignment = .center
        adLabel.text = data?.title ?? ""
        
    }
    
    
    @objc func dismissButtonClicked() {
        dismiss(animated: true)
    }

}
