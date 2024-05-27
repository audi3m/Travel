//
//  TravelTableViewCell.swift
//  Travel0527
//
//  Created by J Oh on 5/27/24.
//

import UIKit
import Kingfisher

class TravelTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    @IBOutlet var stars: [UIImageView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
        
    }
    
    func configureLayout() {
        
        titleLabel.font = .boldSystemFont(ofSize: 16)
        
        descriptionLabel.textColor = .darkGray
        
        infoLabel.textColor = .lightGray
        
        travelImageView.backgroundColor = .systemGray6
        travelImageView.layer.cornerRadius = 10
        travelImageView.contentMode = .scaleAspectFill
        
        likeButton.setTitle("", for: .normal)
        likeButton.tintColor = .white
        likeButton.setTitleShadowColor(.black, for: .normal)
        
        for i in 0..<5 {
            stars[i].image = UIImage(systemName: "star.fill")
            stars[i].tintColor = .lightGray
        }
    }
    
    func configureData(data: Travel) {
        titleLabel.text = data.title
        
        descriptionLabel.text = data.description ?? ""
        
        let grade = Int(round(data.grade ?? 0.0))
        setStars()
        for i in 0..<grade {
            stars[i].tintColor = .systemYellow
        }
        
        infoLabel.text = "저장 " + (data.save ?? 0).formatted()
        
        let url = URL(string: data.travel_image!)
        travelImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "paperplane"))
        
        let image = UIImage(systemName: (data.like ?? false) ? "heart.fill" : "heart")
        likeButton.setImage(image, for: .normal)
        
    }
    
    func setStars() {
        for i in 0..<5 {
            stars[i].tintColor = .lightGray
        }
    }
    
}




//struct Travel {
//    var title: String
//    var description: String?
//    var travel_image: String?
//    var grade: Double?
//    var save: Int?
//    var like: Bool?
//    var ad: Bool
//}
