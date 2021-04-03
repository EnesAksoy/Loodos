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
    private let titleLoclizableKey = "homePageScreen.title"
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    

    // MARK: - Properties
    
    private var viewModel: SplashScreenViewModel!
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if !Reachability.isConnectedToNetwork() {
            self.createAlert(message: self.localizableGetString(forkey: connectionMessageLocalizationKey), title: self.localizableGetString(forkey: errorTitleLocalizationKey))
            return
        }
        
        self.viewModel = SplashScreenViewModel()
        self.viewModel.delegate = self
    }
    
    private func pushViewControllerMethod() {
        let viewController = HomePageScreenViewController()
        viewController.title = self.localizableGetString(forkey: self.titleLoclizableKey)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - SplashScreenViewModelDelegate Methods

extension SplashScreenViewController: SplashScreenViewModelDelegate {
    func updateView(_ value: String) {
        DispatchQueue.main.async {
            self.titleLabel.text = value
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                self.pushViewControllerMethod()
            }
        }
    }
}
