//
//  PickerViewController.swift
//  Calc
//
//  Created by Andrey Boyko on 19.08.2021.
//

//import Foundation
//import UIKit
//
//var rowText: String = ""
//protocol PickerViewControllerDelegate {
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
////    func pickerPrint(rowText: String)
//}
//class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
//   
//    var delegate: PickerViewControllerDelegate?
//    var dataPicker = GeometryDataGenerator.shared.createData()
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return dataPicker.count
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//         
//        return String(dataPicker[row].formulas[row].fields[row].name)
//    }
//    
