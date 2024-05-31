//
//  TravelDetailViewController.swift
//  Travel0527
//
//  Created by J Oh on 5/29/24.
//

import UIKit
import Kingfisher

class TravelDetailViewController: UIViewController {
    
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var starRatingImages: [UIImageView]!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    
    var data: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "상세 정보"
        configureUI()
        configureData()
    }
    
    func configureUI() {
        travelImageView.backgroundColor = .systemGray6
        travelImageView.contentMode = .scaleAspectFill
        
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        for i in 0..<5 {
            starRatingImages[i].image = UIImage(systemName: "star.fill")
            starRatingImages[i].tintColor = .systemGray5
        }
        
        ratingLabel.textColor = .lightGray
        ratingLabel.font = .systemFont(ofSize: 14)
        
        descLabel.numberOfLines = 0
    }
    
    func configureData() {
        guard let data else { return }
        
        let url = URL(string: data.travel_image!)
        travelImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "suitcase"))
        
        titleLabel.text = data.title
        ratingLabel.text = data.saveCountString
        descLabel.text = data.description
        
        for i in 0..<data.gradeToInt {
            starRatingImages[i].tintColor = .systemYellow
        }
    }
}





//struct Travel {
//    let title: String
//    var description: String?
//    var travel_image: String?
//    var grade: Double?
//    var save: Int?
//    var like: Bool?
//    let ad: Bool
//    
//    var saveCountString: String {
//        "저장 " + (self.save ?? 0).formatted()
//    }
//    
//    var gradeToInt: Int {
//        Int(round(self.grade ?? 0.0))
//    }
//}
