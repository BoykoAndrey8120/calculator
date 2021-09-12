//
//  Helpers.swift
//  Calc
//
//  Created by Andrey Boyko on 04.09.2021.
//

import Foundation
import UIKit

extension UITextField {
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.purple.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}
