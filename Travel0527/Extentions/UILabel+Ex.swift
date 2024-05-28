//
//  UILabel.swift
//  Travel0527
//
//  Created by J Oh on 5/29/24.
//

import UIKit

extension UILabel {
    func design(size: CGFloat = 17, weight: UIFont.Weight = .regular, color: UIColor = .label,
                 cornerRadius: CGFloat = 0, borderWidth: CGFloat = 0, numberOfLines: Int = 1, align: NSTextAlignment = .left) {
        self.font = .systemFont(ofSize: size, weight: weight)
        self.textColor = color
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.numberOfLines = numberOfLines
        self.textAlignment = align
    }
}
