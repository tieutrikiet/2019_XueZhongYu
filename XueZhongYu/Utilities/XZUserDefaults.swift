//
//  XZUserDefaults.swift
//  XueZhongYu
//
//  Created by Kiet Tieu on 10/21/19.
//  Copyright © 2019 KietTieu. All rights reserved.
//

import Foundation
import UIKit

struct XZ_Defaults {
    enum XZKey: String {
        case keyA, keyB, keyC
    }
    
    /// Will get user defaults value from a key.
    static func getDefaults(by key: XZKey) -> Any? {
        let userDefaultKey = key.rawValue
        return UserDefaults.standard.object(forKey: userDefaultKey)
    }
    
    /// Will set a value for a key in user defaults.
    static func setDefaults(by key: XZKey, value: Any?) {
        let userDefaultKey = key.rawValue
        UserDefaults.standard.set(value, forKey: userDefaultKey)
        UserDefaults.standard.synchronize()
    }
}
