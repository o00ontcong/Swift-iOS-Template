//
//  HomeViewController.swift
//  Swift-iOS-Template
//
//  Created by Cong Nguyen on 30/09/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = burgerIcon()

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
