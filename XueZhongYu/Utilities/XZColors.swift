//
//  XYZColors.swift
//  XueZhongYu
//
//  Created by Kiệt Tiêu on 10/20/19.
//  Copyright © 2019 KietTieu. All rights reserved.
//

import Foundation
import UIKit

class XZ_Color: UIColor {
    static func ColorFromRGB(R: Int, G: Int, B: Int, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: CGFloat(R) / 255, green: CGFloat(R) / 255, blue: CGFloat(R) / 255, alpha: alpha)
    }

    /// 51, 51, 51 - #333333 - alpha = 1.0
    /// Text color
    static let Emperor = XZ_Color.ColorFromRGB(R: 51, G: 51, B: 51)
    
    /// 244, 244, 244 - #F4F4F4 - alpha = 1.0
    /// Background
    static let WildSand = XZ_Color.ColorFromRGB(R: 244, G: 244, B: 244)
    
    /// 192, 58, 43 - #C03A2B - alpha = 1.0
    /// Error
    static let TollPoppy = XZ_Color.ColorFromRGB(R: 192, G: 58, B: 43)
    
    /// 155, 155, 155 - #9B9B9B - alpha = 1.0
    /// Detail, disabled
    static let DustyGray = XZ_Color.ColorFromRGB(R: 155, G: 155, B: 155)
    
    /// 109, 111, 105 - #6D6F73 - alpha = 1.0
    /// Subtitle
    static let Nevada = XZ_Color.ColorFromRGB(R: 109, G: 111, B: 115)
    
    /// 74, 144, 226 - #4A90E2 - alpha = 1.0
    /// Succeed, selection
    static let HavelockBlue = XZ_Color.ColorFromRGB(R: 74, G: 144, B: 226)
    
    /// 245, 166, 35 - #F5A623 - alpha = 1.0
    /// Warning
    static let ButterCup = XZ_Color.ColorFromRGB(R: 245, G: 166, B: 35)
}

extension XZ_Color {
    enum TintColor {
        case text
        case background
        case subtitle
        case detail
        case selection
        case disabled
        case succeed
        case error
        case warning
        case shadow
        
        func color() -> UIColor {
            switch self {
            case .background:
                return XZ_Color.WildSand
                
            case .subtitle:
                return XZ_Color.Nevada
                
            case .detail:
                return XZ_Color.DustyGray
                
            case .selection:
                return XZ_Color.HavelockBlue
                
            case .disabled:
                return XZ_Color.DustyGray
                
            case .succeed:
                return XZ_Color.HavelockBlue
                
            case .error:
                return XZ_Color.TollPoppy
                
            case .warning:
                return XZ_Color.ButterCup
                
            case .shadow:
                return XZ_Color.Emperor.withAlphaComponent(0.5)
                
            default:
                return XZ_Color.Emperor
            }
        }
    }
}
