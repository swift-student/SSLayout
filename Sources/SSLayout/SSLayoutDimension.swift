//
//  File.swift
//  
//
//  Created by Shawn Gee on 10/1/20.
//

#if canImport(UIKit)
import UIKit

@available(iOS 9.0, *)
public enum SSLayoutDimension {
    public enum Modifier {
        case orGreater
        case orLess
    }
    
    case absolute(CGFloat, _ modifier: Modifier? = nil)
    case fractional(CGFloat, relativeTo: NSLayoutDimension, _ modifier: Modifier? = nil)
}

@available(iOS 9.0, *)
extension SSLayoutDimension: ExpressibleByFloatLiteral {
    public typealias FloatLiteralType = CGFloat.FloatLiteralType
    
    public init(floatLiteral value: Self.FloatLiteralType) {
        self = .absolute(CGFloat(floatLiteral: value))
    }
}

@available(iOS 9.0, *)
extension SSLayoutDimension: ExpressibleByIntegerLiteral {
    public typealias IntegerLiteralType = CGFloat.IntegerLiteralType
    
    public init(integerLiteral value: CGFloat.IntegerLiteralType) {
        self = .absolute(CGFloat(integerLiteral: value))
    }
}

#endif
