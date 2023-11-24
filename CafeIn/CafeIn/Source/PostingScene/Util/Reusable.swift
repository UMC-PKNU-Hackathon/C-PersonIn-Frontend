//
//  Reusable.swift
//  CafeIn
//
//  Created by 제민우 on 11/24/23.
//

import UIKit

protocol Reusable: AnyObject { }

extension Reusable where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: Reusable { }

extension UITableViewCell: Reusable { }
