//
//  TravelTableViewCell.swift
//  Travel0527
//
//  Created by J Oh on 5/27/24.
//

import UIKit
import Kingfisher

class TravelTableViewCell: UITableViewCell {
    
    static let id = "TravelTableViewCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    @IBOutlet var stars: [UIImageView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("Travel cell awakeFromNib") // 8번만 프린트. 재사용 셀의 수만큼 실행.
        configureLayout()
    }
    
    func configureLayout() {
        titleLabel.design(size: 16, weight: .bold)
        descriptionLabel.design(size: 14, color: .darkGray, numberOfLines: 0)
        infoLabel.design(size: 13, color: .lightGray)
        
        travelImageView.imageViewSetting(backgroundColor: .systemGray6, cornerRadius: 10)
        
        likeButton.setTitle("", for: .normal)
        likeButton.tintColor = .white
        likeButton.setTitleShadowColor(.black, for: .normal)
        
        for i in 0..<5 {
            stars[i].image = UIImage(systemName: "star.fill")
            stars[i].tintColor = .systemGray5
        }
    }
    
    func configureData(data: Travel) {
        titleLabel.text = data.title
        
        descriptionLabel.text = data.description ?? ""
        
        setStars()
        for i in 0..<data.gradeToInt {
            stars[i].tintColor = .systemYellow
        }
        
        infoLabel.text = data.saveCountString
        
        let url = URL(string: data.travel_image!)
        travelImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "paperplane"))
        
        let image = UIImage(systemName: (data.like ?? false) ? "heart.fill" : "heart")
        likeButton.setImage(image, for: .normal)
        likeButton.tintColor = (data.like ?? false) ? UIColor.systemPink : .white
        
        print("\(data.title) - configured")
    }
    
    func setStars() {
        for i in 0..<5 {
            stars[i].tintColor = .systemGray5
        }
    }
    
}

