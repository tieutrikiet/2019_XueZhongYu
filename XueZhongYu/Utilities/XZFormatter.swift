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
        case full = "D MMMM, yyyy"
        
        /// 20 Oct, 2019
        case fullWithoutMonth = "D MMM, yyyy"
        
        /// 20/10/2019
        case fullNumberSlash = "DD/MM/yyyy"
        
        /// 20-10-2019
        case fullNumberMinus = "DD-MM-yyyy"
    }
}
