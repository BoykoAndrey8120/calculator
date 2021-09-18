//
//  CalcButton.swift
//  Calc
//
//  Created by Andrey Boyko on 17.08.2021.
//

import UIKit

class CalcButton: UIButton {

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.clipsToBounds = false
        layer.cornerRadius = min(self.frame.height, self.frame.width) / 5
        layer.shadowRadius = 2
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowOpacity = 0.1
    }
}
