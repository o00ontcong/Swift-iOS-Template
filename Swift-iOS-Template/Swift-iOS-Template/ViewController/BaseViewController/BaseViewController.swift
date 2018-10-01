//
//  BaseViewController.swift
//  Swift-iOS-Template
//
//  Created by Cong Nguyen on 30/09/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var loadingIndicator: MBProgressHUD?
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    //MARK: - Public
    func alert(withTitle title: String?, andMessage message: String?) {
        present(Utility.alertC(title, message: message), animated: true)
        
    }
    
    func alert(withTitle title: String?, andMessage message: String?, andCompletion completion: (() -> Void)? = nil) {
        present(Utility.alertC(title, message: message), animated: true)
        
    }
    
    func showLoadingView() {
        UIApplication.shared.keyWindow?.rootViewController?.view.endEditing(true) //To fix keyboard appear bug
        if self.loadingIndicator == nil {
            self.loadingIndicator = MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow?.rootViewController?.view, animated: true)
        }
        
        self.loadingIndicator?.labelText = NSLocalizedString("message_loading", comment: "")
        UIApplication.shared.keyWindow?.addSubview(loadingIndicator!)
        self.loadingIndicator?.show(true)
    }
    
    func hideLoadingView() {
        self.loadingIndicator?.hide(true)
    }
    

    //MARK: -  Call API
    func apiManager(_ path: APIRouter?, setParams params: [String : String]?, tag: String?, error: NSError?) {
        self.alert(withTitle: "Thông báo", andMessage: error?.localizedDescription)
    }
}
