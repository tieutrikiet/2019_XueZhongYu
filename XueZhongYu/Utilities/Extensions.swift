//
//  Extensions.swift
//  XueZhongYu
//
//  Created by Kiệt Tiêu on 10/20/19.
//  Copyright © 2019 KietTieu. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Object
extension NSObject {
    /// Return class's name for this object. Similar to object.typeName.
    static func className() -> String {
        return String(describing: self)
    }
    
    /// Return type's name for this object. Similar to object.className().
    var typeName: String {
        return String(describing: self)
    }
}

// MARK: - UIView
extension UIView {
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
    }
    
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
            self.layer.masksToBounds = true
        }
    }
    
    var borderColor: UIColor {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return UIColor.clear
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        
        self.layer.add(animation, forKey: nil)
    }
    
    func shake(count : Float = 4, for duration : TimeInterval = 0.5, withTranslation translation : Float = 5) {
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: CGFloat(-translation), y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: CGFloat(translation), y: self.center.y))
        layer.add(animation, forKey: "shake")
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func makeShadow(roundedCorner: CGFloat = 0) {
        var cornerRadius = roundedCorner
        if cornerRadius <= 0 {
            cornerRadius = self.cornerRadius
        }
        
        self.layer.shadowColor = XZ_Color.TintColor.shadow.getColor().cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        self.layer.shouldRasterize = true
        self.layer.masksToBounds = false
    }
}

// MARK: - String
extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    func trimmed() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func grouping(every groupSize: String.IndexDistance, with separator: Character) -> String {
        let cleanedUpCopy = replacingOccurrences(of: String(separator), with: "")
        return String(cleanedUpCopy.enumerated().map() {
            $0.offset % groupSize == 0 ? [separator, $0.element] : [$0.element]
            }.joined().dropFirst())
    }
}

// MARK: - UIButton
extension UIButton {
    /// Set button is under "selected" state with solid blue color
    func setSolidColor(_ color: UIColor, textColor: UIColor) {
        self.borderColor = color
        self.backgroundColor = color
        self.setTitleColor(textColor, for: .normal)
        self.tintColor = textColor
    }
    
    /// Set button with a color in its outline. Default border weight is 1px.
    func setOutlineColor(_ color: UIColor, weight: CGFloat = 1) {
        self.borderWidth = weight
        self.borderColor = color
        self.backgroundColor = .clear
        self.setTitleColor(color, for: .normal)
        self.tintColor = color
    }
}
