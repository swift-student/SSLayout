//
//  File.swift
//  
//
//  Created by Shawn Gee on 10/1/20.
//

#if canImport(UIKit)
import UIKit

public enum SSLayoutSpacing {
    public enum Modifier {
        case orGreater
        case orLess
    }
    case equalTo(CGFloat, _ modifier: Modifier? = nil)
    case system(multiplier: CGFloat = 1, _ modifier: Modifier? = nil)
}

#endif
