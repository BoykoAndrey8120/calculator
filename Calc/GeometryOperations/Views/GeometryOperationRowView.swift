//
//  GeometryOperationRowView.swift
//  Calc
//
//  Created by Andrey Boyko on 17.08.2021.
//

import UIKit

class GeometryOperationRowView: UIView {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    var fieldInfo: FieldInfo?
    
    func configure(with fieldInfo: FieldInfo) {
        self.fieldInfo = fieldInfo
        label.text = fieldInfo.name
        textField.text = String(fieldInfo.value)
        textField.keyboardType = .numberPad
    }
    
    func prepareData() {
        setFieldInfoValue(with: textField.text)
    }
    
    private func setFieldInfoValue(with string: String?) {
        guard let str = string,
            let value = Double(str) else { return }
        fieldInfo?.value =  value
    }
    

}
