//
//  CalcOperetionButton.swift
//  Calc
//
//  Created by Andrey Boyko on 12.09.2021.
//

import Foundation
import UIKit

class CalcOperationButton: UIButton {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.clipsToBounds = false
        layer.backgroundColor = UIColor.orange.cgColor
        layer.shadowColor = UIColor.brown.cgColor
        layer.cornerRadius = min(self.frame.height, self.frame.width) / 5
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowOpacity = 0.1
       
    }
    
}
