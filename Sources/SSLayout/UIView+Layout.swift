//
//  File.swift
//  
//
//  Created by Shawn Gee on 10/1/20.
//

#if canImport(UIKit)
import UIKit

@available(iOS 11.0, *)
extension UIView {
   
    // MARK: - Size
    
    @discardableResult
    public func makeWidth(_ dimension: SSLayoutDimension) -> NSLayoutConstraint {
        let widthConstraint: NSLayoutConstraint
        
        switch dimension {
        case .absolute(let constant, let modifier):
            switch modifier {
            case nil:
                widthConstraint = widthAnchor.constraint(equalToConstant: constant)
            case .orGreater:
                widthConstraint = widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
            case .orLess:
                widthConstraint = widthAnchor.constraint(lessThanOrEqualToConstant: constant)
            }
        case .fractional(let multiplier, let dimension, let modifier):
            switch modifier {
            case nil:
                widthConstraint = widthAnchor.constraint(equalTo: dimension, multiplier: multiplier)
            case .orGreater:
                widthConstraint = widthAnchor.constraint(greaterThanOrEqualTo: dimension, multiplier: multiplier)
            case .orLess:
                widthConstraint = widthAnchor.constraint(lessThanOrEqualTo: dimension, multiplier: multiplier)
            }
        }
        
        widthConstraint.isActive = true
        return widthConstraint
    }
    
    @discardableResult
    public func makeHeight(_ dimension: SSLayoutDimension) -> NSLayoutConstraint {
        let heightConstraint: NSLayoutConstraint
        
        switch dimension {
        case .absolute(let constant, let modifier):
            switch modifier {
            case nil:
                heightConstraint = heightAnchor.constraint(equalToConstant: constant)
            case .orGreater:
                heightConstraint = heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
            case .orLess:
                heightConstraint = heightAnchor.constraint(lessThanOrEqualToConstant: constant)
            }
        case .fractional(let multiplier, let dimension, let modifier):
            switch modifier {
            case nil:
                heightConstraint = heightAnchor.constraint(equalTo: dimension, multiplier: multiplier)
            case .orGreater:
                heightConstraint = heightAnchor.constraint(greaterThanOrEqualTo: dimension, multiplier: multiplier)
            case .orLess:
                heightConstraint = heightAnchor.constraint(lessThanOrEqualTo: dimension, multiplier: multiplier)
            }
        }
        
        heightConstraint.isActive = true
        return heightConstraint
    }
    
    @discardableResult
    public func makeSize(width: SSLayoutDimension, height: SSLayoutDimension) -> [NSLayoutConstraint] {
        [makeWidth(width), makeHeight(height)]
    }

    @discardableResult
    public func makeSquare(withSize size: SSLayoutDimension) -> [NSLayoutConstraint] {
        [makeWidth(size), makeHeight(.fractional(1, relativeTo: self.widthAnchor))]
    }
    
    // MARK: - Position

    @discardableResult
    public func pinTop(to anchor: NSLayoutYAxisAnchor, withPadding padding: SSLayoutSpacing = 0) -> NSLayoutConstraint {
        pin(self.topAnchor, to: anchor, withPadding: padding)
    }
    
    @discardableResult
    public func pinLeading(to anchor: NSLayoutXAxisAnchor, withPadding padding: SSLayoutSpacing = 0) -> NSLayoutConstraint {
        pin(self.leadingAnchor, to: anchor, withPadding: padding)
    }
    
    @discardableResult
    public func pinTrailing(to anchor: NSLayoutXAxisAnchor, withPadding padding: SSLayoutSpacing = 0) -> NSLayoutConstraint {
        pin(anchor, to: self.trailingAnchor, withPadding: padding)
    }
    
    @discardableResult
    public func pinBottom(to anchor: NSLayoutYAxisAnchor, withPadding padding: SSLayoutSpacing = 0) -> NSLayoutConstraint {
        pin(anchor, to: self.bottomAnchor, withPadding: padding)
    }
    
    @discardableResult
    public func pinFirstBaseline(to anchor: NSLayoutYAxisAnchor, withPadding padding: SSLayoutSpacing = 0) -> NSLayoutConstraint {
        pin(self.firstBaselineAnchor, to: anchor, withPadding: padding)
    }
    
    @discardableResult
    public func pinLastBaseline(to anchor: NSLayoutYAxisAnchor, withPadding padding: SSLayoutSpacing = 0) -> NSLayoutConstraint {
        pin(self.lastBaselineAnchor, to: anchor, withPadding: padding)
    }
    
    @discardableResult
    public func alignCenterX(to anchor: NSLayoutXAxisAnchor, withOffset offset: SSLayoutSpacing = 0) -> NSLayoutConstraint {
        pin(self.centerXAnchor, to: anchor, withPadding: offset)
    }
    
    @discardableResult
    public func alignCenterY(to anchor: NSLayoutYAxisAnchor, withOffset offset: SSLayoutSpacing = 0) -> NSLayoutConstraint {
        pin(self.centerYAnchor, to: anchor, withPadding: offset)
    }
    
    @discardableResult
    public func pinEdges(_ edges: [SSLayoutEdge],
                         toEdgesOf pinnable: SSLayoutEdgePinnable,
                         withPadding padding: SSLayoutSpacing = 0) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []
        
        for edge in edges {
            switch edge {
            case .top:
                constraints.append(pinTop(to: pinnable.topAnchor, withPadding: padding))
            case .leading:
                constraints.append(pinLeading(to: pinnable.leadingAnchor, withPadding: padding))
            case .trailing:
                constraints.append(pinTrailing(to: pinnable.trailingAnchor, withPadding: padding))
            case .bottom:
                constraints.append(pinBottom(to: pinnable.bottomAnchor, withPadding: padding))
            }
        }
        
        return constraints
    }
    
    // MARK: - Superview
    
    @discardableResult
    public func fillSuperview() -> [NSLayoutConstraint] {
        guard let superview = superview else {
            preconditionFailure("\(Self.self) has no superview to fill.")
        }
        
        return pinEdges(.all, toEdgesOf: superview)
    }
    
	@discardableResult
    public func fillSuperviewSafeArea() -> [NSLayoutConstraint] {
        guard let superview = superview else {
            preconditionFailure("\(Self.self) has no superview to fill.")
        }
        
        pinEdges(.all, toEdgesOf: superview.safeAreaLayoutGuide)
    }
    
	@discardableResult
    public func centerHorizontallyInSuperview(multiplier: CGFloat = 1) -> NSLayoutConstraint {
        guard let superview = superview else {
            preconditionFailure("\(Self.self) has no superview to center in.")
        }
        
        return NSLayoutConstraint(
            item: self,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: superview,
            attribute: .centerX,
            multiplier: multiplier,
            constant: 0
        ).activate()
    }
    
	@discardableResult
    public func centerVerticallyInSuperview(multiplier: CGFloat = 1) -> NSLayoutConstraint {
        guard let superview = superview else {
            preconditionFailure("\(Self.self) has no superview to center in.")
        }
        
        return NSLayoutConstraint(
            item: self,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: superview,
            attribute: .centerY,
            multiplier: multiplier,
            constant: 0
        ).activate()
    }
    
    // MARK: - Private Methods
    
    private func pin<AnchorType>(_ anchor1: NSLayoutAnchor<AnchorType>,
                               to anchor2: NSLayoutAnchor<AnchorType>,
                               withPadding padding: SSLayoutSpacing = 0) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint
        
        switch padding {
        case .equalTo(let constant, let modifier):
            switch modifier {
            case nil:
                constraint = anchor1.constraint(equalTo: anchor2, constant: constant)
            case .orGreater:
                constraint = anchor1.constraint(equalTo: anchor2, constant: constant)
            case .orLess:
                constraint = anchor1.constraint(equalTo: anchor2, constant: constant)
            }
        case .system(multiplier: let multiplier, let modifier):
            if let yAnchor1 = anchor1 as? NSLayoutYAxisAnchor,
               let yAnchor2 = anchor2 as? NSLayoutYAxisAnchor {
                switch modifier {
                case nil:
                    constraint = yAnchor1.constraint(equalToSystemSpacingBelow: yAnchor2, multiplier: multiplier)
                case .orGreater:
                    constraint = yAnchor1.constraint(greaterThanOrEqualToSystemSpacingBelow: yAnchor2, multiplier: multiplier)
                case .orLess:
                    constraint = yAnchor1.constraint(lessThanOrEqualToSystemSpacingBelow: yAnchor2, multiplier: multiplier)
                }
            } else if let xAnchor1 = anchor1 as? NSLayoutXAxisAnchor,
                      let xAnchor2 = anchor2 as? NSLayoutXAxisAnchor {
                switch modifier {
                case nil:
                    constraint = xAnchor1.constraint(equalToSystemSpacingAfter: xAnchor2, multiplier: multiplier)
                case .orGreater:
                    constraint = xAnchor1.constraint(greaterThanOrEqualToSystemSpacingAfter: xAnchor2, multiplier: multiplier)
                case .orLess:
                    constraint = xAnchor1.constraint(lessThanOrEqualToSystemSpacingAfter: xAnchor2, multiplier: multiplier)
                }
            } else {
                fatalError("Anchors must be either X or Y axis anchors")
            }
        }
    
        return constraint.activate()
    }
}

#endif
