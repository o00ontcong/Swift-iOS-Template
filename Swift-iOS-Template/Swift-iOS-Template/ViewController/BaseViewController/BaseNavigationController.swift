//
//  BaseNavigationController.swift
//  Swift-iOS-Template
//
//  Created by Cong Nguyen on 30/09/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // MARK: Navigation Bar Customisation
        
        // To change background colour.
        UINavigationBar.appearance().barTintColor = Constants.HEADER_BAR
//            init(red: 23.0/255, green: 197.0/255, blue: 157.0/255, alpha: 1.0)
        
        // To change colour of tappable items.
        UINavigationBar.appearance().tintColor = .red
        
        // To apply textAttributes to title i.e. colour, font etc.
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.white,
                                                            .font : UIFont.init(name: "AvenirNext-DemiBold", size: 22.0)!]
        // To control navigation bar's translucency.
        UINavigationBar.appearance().isTranslucent = false
        
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
  
    
    //MARK: - Protocol conformance
    
    //MARK: -  Call API

}
