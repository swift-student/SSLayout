//
//  File.swift
//  
//
//  Created by Shawn Gee on 10/1/20.
//

#if canImport(UIKit)
import UIKit

extension NSLayoutConstraint {
    @discardableResult
    public func activate() -> NSLayoutConstraint {
        self.isActive = true
        return self
    }
    
    @discardableResult
    public func deactivate() -> NSLayoutConstraint {
        self.isActive = false
        return self
    }
    
    @discardableResult
    public func withPriority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }
}
#endif
