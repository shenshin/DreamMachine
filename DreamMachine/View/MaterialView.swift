//
//  MaterialView.swift
//  DreamMachine
//
//  Created by Aleksandr Shenshin on 22.07.17.
//  Copyright © 2017 Aleksandr Shenshin. All rights reserved.
//

import UIKit

private var materialKey = false

extension UIView {
    
    @IBInspectable var materialDesign: Bool {
        get {
            return materialKey
        }
        set {
            materialKey = newValue
            
            if materialKey {
                self.layer.masksToBounds = true
                self.layer.cornerRadius = 5.0
                self.layer.shadowOpacity = 0.8
                self.layer.shadowRadius = 5.0
                self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
                self.layer.shadowColor = UIColor(red: 157/255, green: 157/255, blue: 157/255, alpha: 1.0).cgColor
            } else {
                self.layer.cornerRadius = 0
                self.layer.shadowOpacity = 0
                self.layer.shadowRadius = 0
                self.layer.shadowColor = nil
            }
        }
    }
    
}
