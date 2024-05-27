//
//  ADTableViewCell.swift
//  Travel0527
//
//  Created by J Oh on 5/27/24.
//

import UIKit

class ADTableViewCell: UITableViewCell {
     
    @IBOutlet var adLabel: UILabel!
    @IBOutlet var adTextLabel: UILabel!
    @IBOutlet var adUIView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAD()
        
    }
    
    func configureAD() {
        adUIView.layer.cornerRadius = 10
        
        adLabel.text = " AD "
        adLabel.clipsToBounds = true
        adLabel.backgroundColor = .white
        adLabel.layer.cornerRadius = 5
        
        adTextLabel.textAlignment = .center
        adTextLabel.numberOfLines = 0
        adTextLabel.font = .boldSystemFont(ofSize: 15)
    }
    
    func configureText(data: Travel) {
        adTextLabel.text = data.title
    }
    
    
    
    
}
