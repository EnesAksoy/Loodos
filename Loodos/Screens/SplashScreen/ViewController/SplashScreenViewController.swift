//
//  SplashScreenViewController.swift
//  Loodos
//
//  Created by ENES AKSOY on 3.04.2021.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    // MARK: - Constant
    
    private let connectionMessageLocalizationKey = "splashScreen.connectionMessage"
    private let errorTitleLocalizationKey = "messageErrorTitle"

    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if !Reachability.isConnectedToNetwork() {
            self.createAlert(message: self.localizableGetString(forkey: connectionMessageLocalizationKey), title: self.localizableGetString(forkey: errorTitleLocalizationKey))
            return
        }
        
    }
    

}
