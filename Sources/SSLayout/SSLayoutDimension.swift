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
    case absolute(CGFloat)
    case fractional(CGFloat, relativeTo: NSLayoutDimension)
}

#endif
