//
//  APIRouter.swift
//  Swift-iOS-Template
//
//  Created by Cong Nguyen on 30/09/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

import UIKit

enum APIRouter {
    case Login
    case Logout
    case Register(String, String)
    
    var path : String {
        switch self {
        case .Login:
            return "/api/mobile/login"
        case .Logout:
            return "/api/mobile/logout"
        case .Register(let clinicId, let userType):
            return "/api/mobile/register-user?clinicId=\(clinicId)&isOnline=true&userType=\(userType)"
        }
    }
}
