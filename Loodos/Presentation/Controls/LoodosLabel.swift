//
//  LoodosLabel.swift
//  Loodos
//
//  Created by ENES AKSOY on 3.04.2021.
//

import Foundation
import UIKit

class LoodosLabel: UILabel {
    @IBInspectable var localizableKey: String? = nil {
        didSet {
            if localizableKey != nil {
                self.text = NSLocalizedString(localizableKey!, comment: "")
            }
        }
    }
}
