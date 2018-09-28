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
    
    class public func isCheckAuthentication() -> Bool{
        return self.checkKeyIdentifier(identifier: PROJECT_SESSIONKEY)
    }
    class public func checkKeyIdentifier(identifier: String ) -> Bool {
        return UYLPasswordManager.sharedInstance().validKey(nil, forIdentifier: identifier)
    }
    
    class public func authenticationChange(){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: AUTHENTICATION_CHANGE), object: nil)
    }
    
}
