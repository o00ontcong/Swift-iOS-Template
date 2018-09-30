//
//  Constants.swift
//  Swift-iOS-Template
//
//  Created by Cong Nguyen on 30/09/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

import UIKit
func UIColorFromRGB(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
let IS_IPAD = UI_USER_INTERFACE_IDIOM() == .pad
let IS_IPHONE = UI_USER_INTERFACE_IDIOM() == .phone
let IS_RETINA = UIScreen.main.scale >= 2.0

let STATUS_BAR_HEIGHT = UIApplication.shared.statusBarFrame.size.height
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let SCREEN_MAX_LENGTH = max(SCREEN_WIDTH, SCREEN_HEIGHT)
let SCREEN_MIN_LENGTH = min(SCREEN_WIDTH, SCREEN_HEIGHT)
let IS_IPHONE_4_OR_LESS_NEW = IS_IPHONE && SCREEN_MAX_LENGTH < 568.0
let IS_IPHONE_5_NEW = IS_IPHONE && SCREEN_MAX_LENGTH == 568.0
let IS_IPHONE_6_NEW = IS_IPHONE && SCREEN_MAX_LENGTH == 667.0
let IS_IPHONE_6P_NEW = IS_IPHONE && SCREEN_MAX_LENGTH == 736.0
let IS_IPHONE_X = IS_IPHONE && SCREEN_MAX_LENGTH == 812

let SW = SCREEN_WIDTH / 360
let SH = SCREEN_HEIGHT / 640

class Constants: NSObject {
    class var sharedInstance: Helper {
        struct Static {
            static let instance: Helper = Helper()
        }
        return Static.instance
    }
    static let LEFT_SLIDER_VIEW_WIDTH = (UIScreen.main.bounds.size.width) / 1.5
    
    //New Theming Constants
    static let HEADER_BAR = UIColor(red: 0 / 255.0, green: 104.0 / 255.0, blue: 85.0 / 255.0, alpha: 1.0)
    static let HEADER_BAR_TEXT_COLOR = UIColor.white
    static let BACKGROUND = UIColorFromRGB(rgbValue: 0xf1f2f7)
    static let BOTTOM_BAR_GRADIENT_START_COLOR = UIColor(red: 19.0 / 255.0, green: 201.0 / 255.0, blue: 254.0 / 255.0, alpha: 1.0)
    static let BOTTOM_BAR_GRADIENT_END_COLOR = UIColor(red: 41.0 / 255.0, green: 128.0 / 255.0, blue: 184.0 / 255.0, alpha: 1.0)
    //Old Theming
    static let FOOTER_BG_COLOR = UIColor.white
    static let FOOTER_UNSELECTED = UIColor(red: 109.0 / 255.0, green: 109.0 / 255.0, blue: 109.0 / 255.0, alpha: 1.0)
    static let FOOTER_SELECTED = HEADER_BAR
    
    static let MENU_TRANG_CHU = "Trang chủ"
    static let MENU_THONG_TIN_CA_NHAN = "Thông tin cá nhân"
    static let MENU_THONG_TIN_TICH_LUY = "Thông tin tích luỹ"
    
    
}
