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
    
    func pushAnimation(type: CATransitionSubtype) {
        let transition:CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = type
        self.navigationController!.view.layer.add(transition, forKey: kCATransition)
    }
}


