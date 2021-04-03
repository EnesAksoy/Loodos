//
//  LoodosButton.swift
//  Loodos
//
//  Created by ENES AKSOY on 3.04.2021.
//

import Foundation
import UIKit

class LoodosButton: UIButton {
    @IBInspectable var localizableKey: String? = nil {
        didSet {
            if localizableKey != nil {
                self.setTitle(NSLocalizedString(localizableKey!, comment: ""), for: .normal)
            }
        }
    }
}
