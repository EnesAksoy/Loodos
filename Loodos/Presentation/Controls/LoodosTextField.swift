//
//  LoodosTextField.swift
//  Loodos
//
//  Created by ENES AKSOY on 3.04.2021.
//

import Foundation
import UIKit

class LoodosTextField: UITextField {
    @IBInspectable var localizableKey: String? = nil {
        didSet {
            if localizableKey != nil {
                self.placeholder = NSLocalizedString(localizableKey!, comment: "")
            }
        }
    }
}
