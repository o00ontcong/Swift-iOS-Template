//
//  Helper.swift
//  Swift-iOS-Template
//
//  Created by Cong Nguyen on 28/09/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

import UIKit

class Helper: NSObject {
    class var sharedInstance: Helper {
        struct Static {
            static let instance: Helper = Helper()
        }
        return Static.instance
    }
    var userInfo = UserInfo()
    
}
