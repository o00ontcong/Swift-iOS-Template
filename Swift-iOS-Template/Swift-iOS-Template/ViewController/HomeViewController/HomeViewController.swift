//
//  HomeViewController.swift
//  Swift-iOS-Template
//
//  Created by Cong Nguyen on 30/09/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController, APIManagerDelegate{

    

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = burgerIcon()
        var paramsProfile = [String:String]()
        paramsProfile["date"] = "13/4/2018"
        paramsProfile["user_id"] = "860526"
        APIManager.sharedInstance.call(APIRouter.Profile,
                                       setAction: .post,
                                       setParams: paramsProfile,
                                       setDelegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    //MARK: - Custom Accessors
    func configureView() {
        
    }
    
    //MARK: - IBActions
    @IBAction func actionSave(_ sender: Any) {
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
        case .Profile:
            print(JSON)

            break
        default:
            break
        }
    }

}
