//
//  ShadowView.swift
//  Loodos
//
//  Created by ENES AKSOY on 3.04.2021.
//

import Foundation
import UIKit

class ShadowView: UIView {
    private var shadowLayer: CAShapeLayer!
    @IBInspectable var cornerRadius: CGFloat = 25
    override func layoutSubviews() {
        super.layoutSubviews()
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height), cornerRadius: cornerRadius).cgPath
            shadowLayer.fillColor = UIColor.lightGray.cgColor
            shadowLayer.shadowColor = UIColor(white: 0, alpha: 0.4).cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = .zero
            shadowLayer.shadowOpacity = 0.3
            shadowLayer.shadowRadius = 9
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
}
