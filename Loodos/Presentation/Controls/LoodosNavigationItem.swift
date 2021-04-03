//
//  LoodosNavigationItem.swift
//  Loodos
//
//  Created by ENES AKSOY on 3.04.2021.
//

import Foundation
import UIKit

class LoodosNavigationItem: UINavigationItem {
    @IBInspectable var localizableKey: String? = nil {
        didSet {
            if localizableKey != nil {
                self.title = NSLocalizedString(localizableKey!, comment: "")
            }
        }
    }
}
