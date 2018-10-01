//
//  LoginViewController.swift
//  Swift-iOS-Template
//
//  Created by Cong Nguyen on 28/09/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

import UIKit
class LoginViewController: BaseViewController, APIManagerDelegate{

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - Custom Accessors
    func configureView() {
        
    }
    
    //MARK: - IBActions
    @IBAction func actionLogin(_ sender: Any) {
     
        var params = [String:String]()
        params["username"] = "viettel12_giaovien01"
        params["password"] = "12345678aA@"
        APIManager.sharedInstance.call(APIRouter.Login,
                                       setAction: .post,
                                       setParams: params,
                                       isToken: false,
                                       tag: nil,
                                       setDelegate: self)
        
    }
    //MARK: - Public
    func publicMethod() {
        
    }
    
    //MARK: - Private
    func privateMethod() {
        
    }
    
    //MARK: - Protocol conformance
    
    //MARK: -  Call API
    func apiManager(_ path: APIRouter, setParams params: [String : String]?, tag: String?, completed JSON: [String : AnyObject]?) {
        
        switch path {
        case .Login:
            
            if let userInfo = UserInfo(JSON: JSON!) {
                Constants.sharedInstance.userInfo = userInfo
                Utility.registerKey(PROJECT_SESSIONKEY, withValue: userInfo.token)
                Utility.authenticationChange()
            }
           
            break
            
        default:
            break
        }
        
    }
    

}
