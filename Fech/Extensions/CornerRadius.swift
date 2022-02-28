//
//  CornerRadius.swift
//  Fech
//
//  Created by MAC on 22/02/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
