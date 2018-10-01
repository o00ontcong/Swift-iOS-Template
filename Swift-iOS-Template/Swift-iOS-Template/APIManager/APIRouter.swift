//
//  APIRouter.swift
//  Swift-iOS-Template
//
//  Created by Cong Nguyen on 30/09/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

import UIKit
let BASE_URL = "http://171.255.192.109:8778/Services/"
enum APIRouter {
    case Login
    case Logout
    case Profile
    case Register(String, String)
    
    var path : String {
        switch self {
        case .Login:
            return "UserModule.svc/authenticate"
        case .Logout:
            return "api/mobile/logout"
        case .Register(let clinicId, let userType):
            return "api/mobile/register-user?clinicId=\(clinicId)&isOnline=true&userType=\(userType)"
        case .Profile:
            return "UserModule.svc/homeprofile"
        }
    }
}
