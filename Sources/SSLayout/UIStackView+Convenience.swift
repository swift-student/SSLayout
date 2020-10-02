//
//  UIStackView+Convenience.swift
//  
//
//  Created by Shawn Gee on 10/2/20.
//

import Foundation

extension UIStackView {
    public static func hStack(_ views: UIView...) -> UIStackView {
        let hStack = UIStackView(arrangedSubviews: views)
        return hStack
    }
    
    public static func vStack(_ views: UIView...) -> UIStackView {
        let vStack = UIStackView(arrangedSubviews: views)
        vStack.axis = .vertical
        return vStack
    }
    
    @discardableResult
    public func setUp(spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        return self
    }
    
    @discardableResult
    public func padding(_ padding: CGFloat) -> UIStackView {
        self.layoutMargins = .init(top: padding, left: padding, bottom: padding, right: padding   )
        self.isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    @discardableResult
    public func padding(_ edgeInsets: UIEdgeInsets) -> UIStackView {
        self.layoutMargins = edgeInsets
        self.isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    @discardableResult
    public func padding(_ edges: [SSLayoutEdge], _ amount: CGFloat = 8) -> UIStackView {
        for edge in edges {
            switch edge {
            case .top:
                self.layoutMargins.top = amount
            case .leading:
                self.layoutMargins.left = amount
            case .trailing:
                self.layoutMargins.right = amount
            case .bottom:
                self.layoutMargins.bottom = amount
            }
        }
        
        self.isLayoutMarginsRelativeArrangement = true
        return self
    }
}

