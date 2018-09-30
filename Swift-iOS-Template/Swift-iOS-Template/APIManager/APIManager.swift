//
//  APIManager.swift
//  Swift-iOS-Template
//
//  Created by Cong Nguyen on 30/09/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

func defaultHeader()  -> [String:String] {
    guard let token = UserDefaults.standard.value(forKey: PROJECT_SESSIONKEY) else {
        return ["Content-Type": "application/json; charset=utf-8"]
    }
    let header =  [
        "Content-Type": "application/json; charset=utf-8",
        "token": token
        ] as! [String:String]
    return header
    
}
protocol APIManagerDelegate: NSObjectProtocol {
    func apiManager(_ path: String, setAction action: HTTPMethod, setParams params: [String : String]?, tag: String?, completed JSON: [String : AnyObject]?)
    
    func apiManager(_ path: String?, setAction action: HTTPMethod?, setParams params: [String : String]?, tag: String?, error:NSError?)
}
class APIManager: NSObject {
    class var sharedInstance: APIManager {
        struct Static {
            static let instance: APIManager = APIManager()
        }
        return Static.instance
    }
    weak var delegate: APIManagerDelegate!

    class func isInternetAvailable() -> Bool {
        let networkReachability = Reachability()
        
        let networkStatus: NetworkStatus = networkReachability.currentReachabilityStatus()
        
        return networkStatus != NotReachable
        
    }
    
    func call(_ pathString: String, setAction action: HTTPMethod, setParams params: [String : String]?, isToken: Bool, tag: String?, setDelegate delegateRef: APIManagerDelegate?) {
        self.delegate = delegateRef;

        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        manager.request(pathString, method: action, parameters: params, encoding: JSONEncoding.default, headers: defaultHeader()).responseJSON { (response) in
            
            switch response.result {
            case .success:do {
                guard let data = response.data else {
                    let error = NSError(domain: "", code: 404, userInfo: ["description":"Parse Fail"])
                   self.delegate.apiManager(pathString, setAction: action, setParams: params, tag: tag, error: error)
                    return
                }
                let dict = JSON(data: data)
//                self.delegate.apiManager(pathString, setAction: action, setParams: params, tag: tag, completed: )
               
                break
                }
            case .failure(let error):do {
                
                break
                }
            }
            
        }
        
        
        
        
    }
    
    func call(_ pathString: String?, setAction action: String?, setParams params: [AnyHashable : Any]?, tag: String?, setDelegate delegateRef: APIManagerDelegate?) {
    }
    func call(_ pathString: String?, setAction action: String?, setParams params: [AnyHashable : Any]?, setDelegate delegateRef: APIManagerDelegate?) {
    }
    
    func mock(_ pathString: String?, setAction action: String?, setParams params: [AnyHashable : Any]?, isToken: Bool, tag: String?, setDelegate delegateRef: APIManagerDelegate?) {
    }
    
    func mock(_ pathString: String?, setAction action: String?, setParams params: [AnyHashable : Any]?, tag: String?, setDelegate delegateRef: APIManagerDelegate?) {
    }
    
    func mock(_ pathString: String?, setAction action: String?, setParams params: [AnyHashable : Any]?, setDelegate delegateRef: APIManagerDelegate?) {
    }

}
