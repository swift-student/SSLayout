//
//  File.swift
//  
//
//  Created by Shawn Gee on 10/1/20.
//

#if canImport(UIKit)
import UIKit

extension UIView {
    public func addSubviewsUsingAutolayout(_ subviews: UIView...) {
        for subview in subviews {
            subview.translatesAutoresizingMaskIntoConstraints = false
            addSubview(subview)
        }
    }
}

#endif
