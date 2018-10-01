//
//  LeftSliderViewController.swift
//  Swift-iOS-Template
//
//  Created by Cong Nguyen on 30/09/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

import UIKit
protocol LeftSliderViewControllerDelegate: class {
    func didTapped(onMenu optionTitle: String?)
}
class LeftSliderViewController: UIViewController ,LGSideMenuDelegate{
    weak var delegate: LeftSliderViewControllerDelegate?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        self.configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK: - Custom Accessors
    func configureView() {
        let buttonLogOut = UIButton(frame: CGRect(x: 20, y: SCREEN_HEIGHT - 65, width: 100, height: 45))
        buttonLogOut.setTitle("Logout", for: .normal)
        buttonLogOut.setTitleColor(UIColor.black, for: .normal)
        buttonLogOut.backgroundColor = UIColor.white
        buttonLogOut.addTarget(self, action: #selector(self.actionLogOut(_:)) , for: UIControlEvents.touchUpInside)
        self.view.addSubview(buttonLogOut)
        
        let buttonProfile = UIButton(frame: CGRect(x: 20, y: SCREEN_HEIGHT - 155, width: 100, height: 45))
        buttonProfile.setTitle("Profile", for: .normal)
        buttonProfile.setTitleColor(UIColor.black, for: .normal)
        buttonProfile.backgroundColor = UIColor.white
        buttonProfile.addTarget(self, action: #selector(self.actionProfile(_:)) , for: UIControlEvents.touchUpInside)
        self.view.addSubview(buttonProfile)
        
    }
    
    //MARK: - IBActions
    @IBAction func actionLogOut(_ sender: Any) {
        Utility.deleteKey(PROJECT_SESSIONKEY)
        Utility.authenticationChange()

    }
    @IBAction func actionProfile(_ sender: Any) {
        delegate?.didTapped(onMenu: Constants.MENU_TRANG_CHU)
        sideMenuController?.hideLeftView(animated: true, completionHandler: nil)
        
    }
    //MARK: - Public
    func publicMethod() {
        
    }
    
    //MARK: - Private
    func privateMethod() {
        
    }
    
    //MARK: - Protocol conformance


}
