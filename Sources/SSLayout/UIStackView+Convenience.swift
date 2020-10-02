//
//  UIStackView+Convenience.swift
//  
//
//  Created by Shawn Gee on 10/2/20.
//

#if canImport(UIKit)
import UIKit

@available(iOS 11.0, *)
extension UIStackView {
    /// Creates a horizontal UIStackView using the UIViews passed in the variadic `views` parameter.
    /// - Parameter views: The views to be arranged by the stack view.
    /// - Returns: A new UIStackView object with the provided views as subviews.
    public static func hStack(_ views: UIView...) -> UIStackView {
        let hStack = UIStackView(arrangedSubviews: views)
        return hStack
    }
    
    /// Creates a vertical UIStackView using the UIViews passed in the variadic `views` parameter.
    /// - Parameter views: The views to be arranged by the stack view.
    /// - Returns: A new UIStackView object with the provided views as subviews.
    public static func vStack(_ views: UIView...) -> UIStackView {
        let vStack = UIStackView(arrangedSubviews: views)
        vStack.axis = .vertical
        return vStack
    }
    
    /// Provides a convenient way to set up the spacing, alignment, and distribution of a UIStackView.
    /// - Parameters:
    ///   - spacing: The distance in points between the adjacent edges of the stack view’s arranged views.
    ///   Defaults to 0.
    ///   - alignment: The alignment of the arranged subviews perpendicular to the stack view’s axis.
    ///   Defaults to `.fill`.
    ///   - distribution: The distribution of the arranged views along the stack view’s axis.
    ///   Defaults to `.fill`.
    /// - Returns: The UIStackView that this method is called on with the spacing alignment,
    /// and distribution properties updated according to the values passed in.
    @discardableResult
    public func setUp(spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        return self
    }
    
    /// Pads the stack view along all edges by the specified amount.
    /// - Parameter amount: The amount to pad this stack view on each edge.
    /// - Returns: The UIStackView that this method is called on with the `layoutMargins`
    /// set according to the padding passed in, and `isLayoutMarginsRelativeArrangment` set to true.
    @discardableResult
    public func padding(_ amount: CGFloat) -> UIStackView {
        self.layoutMargins = .init(top: amount, left: amount, bottom: amount, right: amount   )
        self.isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    /// Pads the stack view using the edges and padding amount specified
    /// - Parameter edgeInsets: The NSDirectionalEdgeInsets to use for padding the stack view.
    /// - Returns: The UIStackView that this method is called on with the `layoutMargins`
    /// set to the edge insets passed in, and `isLayoutMarginsRelativeArrangment` set to true.
    @discardableResult
    public func padding(_ directionalEdgeInsets: NSDirectionalEdgeInsets) -> UIStackView {
        self.directionalLayoutMargins = directionalEdgeInsets
        self.isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    /// Pads the stack view on the given edges by a specified amount, or 8pts if no value is provided.
    /// - Parameters:
    ///   - edges: The edges to apply the specified padding to.
    ///   - amount: The amount of padding to apply to the given edges. Defaults to 8 pts.
    /// - Returns: The UIStackView that this method is called on with the corresponding `directionalLayoutMargins`
    ///  updated with the edges and amount passed in, and `isLayoutMarginsRelativeArrangment` set to true.
    @discardableResult
    public func padding(_ edges: [SSLayoutEdge], _ amount: CGFloat = 8) -> UIStackView {
        for edge in edges {
            switch edge {
            case .top:
                self.directionalLayoutMargins.top = amount
            case .leading:
                self.directionalLayoutMargins.leading = amount
            case .trailing:
                self.directionalLayoutMargins.trailing = amount
            case .bottom:
                self.directionalLayoutMargins.bottom = amount
            }
        }
        
        self.isLayoutMarginsRelativeArrangement = true
        return self
    }
}

#endif

