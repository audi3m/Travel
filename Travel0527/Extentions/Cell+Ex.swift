//
//  Cell+Ex.swift
//  Travel0527
//
//  Created by J Oh on 5/31/24.
//

import UIKit

extension UITableViewCell {
    static var id: String {
        String(describing: self)
    }
}

extension UIViewController {
    static var id: String {
        String(describing: self)
    }
}
