//
//  ViewController.swift
//  Swift-iOS-Template
//
//  Created by Cong Nguyen on 28/09/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var color :  UIColor? {
        get {
            #if DEV
            return  UIColor.red
            #elseif STAGING
            return  UIColor.yellow
            #elseif PRODUCT
            return  UIColor.blue
            #else
            return  UIColor.purple
            #endif
        }
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = color
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
    
    


}

