//
//  XZFormatter.swift
//  XueZhongYu
//
//  Created by Kiệt Tiêu on 10/20/19.
//  Copyright © 2019 KietTieu. All rights reserved.
//

import Foundation
import UIKit

struct XZ_Formatter {
    enum dateTime: String {
        /// 20 October, 2019
        case fullDate = "D MMMM, yyyy"
        
        /// 20 Oct, 2019
        case fullDateWithoutMonth = "D MMM, yyyy"
        
        /// 20/10/2019
        case fullDateNumberSlash = "DD/MM/yyyy"
        
        /// 20-10-2019
        case fullDateNumberMinus = "DD-MM-yyyy"
        
        /// 20 October, 2019 (16:52)
        case fullDateTime = "D MMMM, yyyy (HH:mm)"
        
        /// 16:52 - 20 October, 2019
        case fullTimeDate = "HH:mm - D MMMM, yyyy"
        
        /// 16:52
        case onlyTime = "HH:mm"
    }
    
    /// Convert a date time to string based on a specific format string.
    static func dateToString(from date: Date, format: String, UTC: Bool = true) -> String {
        var value = ""
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        
        if UTC {
            dateFormatter.timeZone = TimeZone(identifier: "UTC") ?? TimeZone.current
        }
        
        dateFormatter.dateFormat = format
        value = dateFormatter.string(from: date)
        
        return value
    }
}
