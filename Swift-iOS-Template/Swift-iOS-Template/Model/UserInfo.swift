//
//  UserInfo.swift
//  Swift-iOS-Template
//
//  Created by Cong Nguyen on 01/10/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

import UIKit
import ObjectMapper

class UserInfo: Mappable {
    var error_code : String?
    var error_message : String?
    var success : Bool?
    var token : String?
    var failed_password_attemp_count : Int?
    var max_failed_password_attemp_count : Int?
    var user_id : Int?
    init() {
        
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        error_code <- map["error_code"]
        error_message <- map["error_message"]
        success <- map["success"]
        token <- map["token"]
        failed_password_attemp_count <- map["failed_password_attemp_count"]
        max_failed_password_attemp_count <- map["max_failed_password_attemp_count"]
        user_id <- map["user_id"]
    }
    
}
