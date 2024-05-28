//
//  UIImageView+Ex.swift
//  Travel0527
//
//  Created by J Oh on 5/29/24.
//

import UIKit

extension UIImageView {
    
    func imageViewSetting(backgroundColor: UIColor = .clear, cornerRadius: CGFloat = 0, contentMode: UIView.ContentMode = .scaleAspectFill) {
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.contentMode = contentMode
    }
}
