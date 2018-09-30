//
//  UnifiedTabBarViewController.swift
//  Swift-iOS-Template
//
//  Created by Cong Nguyen on 30/09/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

import UIKit

class UnifiedTabBarViewController: UITabBarController,UITabBarControllerDelegate, LeftSliderViewControllerDelegate {
    var vcWallet :BaseNavigationController!
    var vcPayment  :BaseNavigationController!
    var vcPayment1 :BaseNavigationController!
    var vcPayment2 :BaseNavigationController!

    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self;
        self.configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - Custom Accessors
    func configureView() {
        // Configure tab
        let homeVC = HomeViewController()
        homeVC.view.backgroundColor = .red
        vcWallet = BaseNavigationController(rootViewController: homeVC)
        vcWallet.tabBarItem = UITabBarItem(title: NSLocalizedString("TAB_1", comment: ""), image: UIImage(named: "tapbar_wallet_icon_inactive"), tag: 1)
        vcWallet.tabBarItem.image = UIImage(named: "tapbar_wallet_icon_inactive")?.withRenderingMode(.alwaysOriginal)
        vcWallet.tabBarItem.selectedImage = UIImage(named: "tapbar_wallet_icon_active")?.withRenderingMode(.alwaysTemplate)

        //Configure tab
        let homeVC1 = WalletViewController()
        homeVC1.view.backgroundColor = .blue
        vcPayment = BaseNavigationController(rootViewController:homeVC1)
        vcPayment.navigationController?.setNavigationBarHidden(true, animated: true)
        vcPayment.tabBarItem = UITabBarItem(title: NSLocalizedString("TAB_2", comment: ""), image: UIImage(named: "Profile_icon"), tag: 2)
        vcPayment.tabBarItem.image = UIImage(named: "Profile_icon")?.withRenderingMode(.alwaysOriginal)
        vcPayment.tabBarItem.selectedImage = UIImage(named: "Profile_icon")?.withRenderingMode(.alwaysOriginal)
        
        //Configure tab
        let homeVC2 = HomeViewController()
        homeVC2.view.backgroundColor = .yellow
        vcPayment1 = BaseNavigationController(rootViewController:homeVC2)
        vcPayment1.tabBarItem = UITabBarItem(title: NSLocalizedString("TAB_2", comment: ""), image: UIImage(named: "Profile_icon"), tag: 2)
        vcPayment1.tabBarItem.image = UIImage(named: "Profile_icon")?.withRenderingMode(.alwaysOriginal)
        vcPayment1.tabBarItem.selectedImage = UIImage(named: "Profile_icon")?.withRenderingMode(.alwaysOriginal)
        
        //Configure tab
        let homeVC3 = HomeViewController()
        homeVC3.view.backgroundColor = UIColor.purple
        vcPayment2 = BaseNavigationController(rootViewController:homeVC3)
        vcPayment2.tabBarItem = UITabBarItem(title: NSLocalizedString("TAB_2", comment: ""), image: UIImage(named: "Profile_icon"), tag: 2)
        vcPayment2.tabBarItem.image = UIImage(named: "Profile_icon")?.withRenderingMode(.alwaysOriginal)
        vcPayment2.tabBarItem.selectedImage = UIImage(named: "Profile_icon")?.withRenderingMode(.alwaysOriginal)
        viewControllers = [vcWallet, vcPayment, vcPayment1, vcPayment2]
        
        self.setTabbarAppearance()

        
    }
    
    //MARK: - IBActions
    @IBAction func actionSave(_ sender: Any) {
    }
    //MARK: - Public
    func publicMethod() {
        
    }
    
    //MARK: - Private
    func setTabbarAppearance() {
        //set tabBarController attributes
        
        let backgroundColor: UIColor = Constants.FOOTER_BG_COLOR // [UIColor colorWithRed:22.0/255 green:30.0/255 blue:38.0/255 alpha:1.0];
        
        let selectedColor: UIColor = Constants.FOOTER_SELECTED // DEFAULT_BUTTONBACKGROUND_COLOR;
        
        // set the bar background color
        UITabBar.appearance().backgroundImage = Utility.image(from: backgroundColor, for: CGSize(width: 320, height: 49), withCornerRadius: 0)
        
        // set the text color for selected state
            UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor : selectedColor,
                                                              .font : UIFont.init(name: "AvenirNext-DemiBold", size: 22.0)!], for: .selected)
        
        // set the selected icon color
        UITabBar.appearance().tintColor =  Constants.HEADER_BAR

        
        // remove the shadow
        UITabBar.appearance().shadowImage = nil
        
        
        //set nav color
        UINavigationBar.appearance().tintColor = Constants.HEADER_BAR_TEXT_COLOR
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
    }
    
    //MARK: - Protocol conformance
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let navController = selectedViewController as? BaseNavigationController
        navController?.popToRootViewController(animated: false)
        viewController.viewDidAppear(true)
    }
    //MARK: - Delegate
    func didTapped(onMenu optionTitle: String?) {
        moveScreen(optionTitle)
    }

    
    func moveScreen(_ optionTitle: String?) {
        if (optionTitle == Constants.MENU_TRANG_CHU) {
            selectedViewController = vcWallet
        } else if (optionTitle == Constants.MENU_THONG_TIN_TICH_LUY) {
            selectedViewController = vcPayment
        }

        
    }
    

}
