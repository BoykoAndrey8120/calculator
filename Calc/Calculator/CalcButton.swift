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
        layer.cornerRadius = min(self.frame.height, self.frame.width) / 2 
        layer.shadowRadius = 5
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 4, height: 4)
//        layer.shadowPath = CGPath(rect: self.frame, transform: nil)
        layer.shadowOpacity = 0.1
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
