//
//  APIManager.swift
//  Swift-iOS-Template
//
//  Created by Cong Nguyen on 30/09/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
func defaultHeader()  -> [String:String] {
    guard let token =  Constants.sharedInstance.userInfo.token else {
        return ["Content-Type": "application/json; charset=utf-8"]
    }
    let header =  [
        "Content-Type": "application/json; charset=utf-8",
        "token": token
    ]
    return header
    
}
protocol APIManagerDelegate: NSObjectProtocol {
    func apiManager(_ path: APIRouter, setParams params: [String : String]?, tag: String?, completed JSON: [String : AnyObject]?)
    
    func apiManager(_ path: APIRouter?, setParams params: [String : String]?, tag: String?, error:NSError?)
}
class APIManager: NSObject {
    class var sharedInstance: APIManager {
        struct Static {
            static let instance: APIManager = APIManager()
        }
        return Static.instance
    }
    var delegate: APIManagerDelegate!

    class func isInternetAvailable() -> Bool {
        let networkReachability = Reachability()
        
        let networkStatus: NetworkStatus = networkReachability.currentReachabilityStatus()
        
        return networkStatus != NotReachable
        
    }
    
    func call(_ pathString: APIRouter, setAction action: HTTPMethod, setParams params: [String : String]?, isToken: Bool, tag: String?, setDelegate delegateRef: APIManagerDelegate?) {
        self.delegate = delegateRef;

        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        manager.request(BASE_URL + pathString.path, method: action, parameters: params, encoding: JSONEncoding.default, headers: defaultHeader()).responseJSON { (response) in
            
            switch response.result {
            case .success(let data):
                // First make sure you got back a dictionary if that's what you expect
                guard let json = data as? [String : AnyObject] else {
                    self.delegate.apiManager(pathString, setParams: params, tag: tag, error: NSError(domain: "", code: 3333, userInfo: nil))
                    return
                }
                self.delegate.apiManager(pathString, setParams: params, tag: tag, completed: json)
                break
                
            case .failure(let error):
                self.delegate.apiManager(pathString, setParams: params, tag: tag, error: error as NSError)
                break
                
            }
            
        }
        
        
        
        
    }
    
    func call(_ pathString: APIRouter, setAction action: HTTPMethod, setParams params: [String : String]?, tag: String?, setDelegate delegateRef: APIManagerDelegate?) {
        self.call(pathString, setAction: action, setParams: params, isToken: true, tag: tag, setDelegate: delegateRef)
        
    }
    func call(_ pathString: APIRouter, setAction action: HTTPMethod, setParams params: [String : String]?, setDelegate delegateRef: APIManagerDelegate?) {
        self.call(pathString, setAction: action, setParams: params, isToken: true, tag: "", setDelegate: delegateRef)
    }
    
    func mock(_ pathString: String?, setAction action: String?, setParams params: [AnyHashable : Any]?, isToken: Bool, tag: String?, setDelegate delegateRef: APIManagerDelegate?) {
    }
    
    func mock(_ pathString: String?, setAction action: String?, setParams params: [AnyHashable : Any]?, tag: String?, setDelegate delegateRef: APIManagerDelegate?) {
    }
    
    func mock(_ pathString: String?, setAction action: String?, setParams params: [AnyHashable : Any]?, setDelegate delegateRef: APIManagerDelegate?) {
    }

}
