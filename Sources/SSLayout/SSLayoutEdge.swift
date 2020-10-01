//
//  File.swift
//  
//
//  Created by Shawn Gee on 10/1/20.
//

#if canImport(UIKit)
import UIKit

public enum SSLayoutEdge {
    case top
    case leading
    case trailing
    case bottom
}

extension ExpressibleByArrayLiteral where ArrayLiteralElement == SSLayoutEdge {
    public static var all: Self { [.top, .leading, .trailing, .bottom] }
    public static var horizontal: Self { [.leading, .trailing] }
    public static var vertical: Self { [.top, .bottom] }
}

@available(iOS 9.0, *)
public protocol SSLayoutEdgePinnable {
    var topAnchor: NSLayoutYAxisAnchor { get }
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
}

@available(iOS 9.0, *)
extension UILayoutGuide: SSLayoutEdgePinnable {}
extension UIView: SSLayoutEdgePinnable {}

#endif
