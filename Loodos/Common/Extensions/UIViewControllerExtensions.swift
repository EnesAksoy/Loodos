//
//  UIViewControllerExtensions.swift
//  Loodos
//
//  Created by ENES AKSOY on 3.04.2021.
//

import Foundation
import UIKit

public extension UIViewController {
    
    func createAlert(message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: self.localizableGetString(forkey: "ok_button_text"), style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }

    func localizableGetString(forkey: String) -> String {
        let string = NSLocalizedString(forkey, comment: "")
        return string
    }
}


