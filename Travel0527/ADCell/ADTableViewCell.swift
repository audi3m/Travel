//
//  ADTableViewCell.swift
//  Travel0527
//
//  Created by J Oh on 5/27/24.
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    static let id = "ADTableViewCell"
     
    @IBOutlet var adLabel: UILabel!
    @IBOutlet var adTextLabel: UILabel!
    @IBOutlet var adUIView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("AD Cell awakeFromNib")
        configureAD()
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
        // 터치하면 색이 변함 ??
//        let colors: [UIColor] = [.green, .blue, .red, .orange]
//        adUIView.backgroundColor = colors.randomElement()?.withAlphaComponent(0.2)
//    }
    
    func configureAD() {
        adUIView.layer.cornerRadius = 10
        
        adLabel.text = " AD "
        adLabel.clipsToBounds = true
        adLabel.backgroundColor = .white
        adLabel.layer.cornerRadius = 5
        
        adTextLabel.design(size: 15, weight: .bold, numberOfLines: 0, align: .center)
    }
    
    func configureText(data: Travel) {
        adTextLabel.text = data.title
    }
    
    
    
    
}
