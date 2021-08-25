//
//  CurrencyConvertViewController.swift
//  Calc
//
//  Created by Andrey Boyko on 04.07.2021.
//

import Foundation
import UIKit
enum LastEditedField {
    case first
    case second
}
class CurrencyConvertViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var uahTextField: UITextField!
    @IBOutlet weak var usdTextField: UITextField!
    @IBOutlet weak var resultTextField: UITextField!
    var lastEdited: LastEditedField = .first
    var tappedLabel: UILabel?
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        self.uahTextField.delegate = self
//        self.usdTextField.delegate = self
//        self.resultTextField.delegate = self
        [uahTextField,usdTextField].forEach({ $0?.delegate = self })
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
//        let tapGestureUSD = UITapGestureRecognizer(target: self, action: #selector(labelTapped))

//        uahTextField.addGestureRecognizer(tapGesture)
//        usdTextField.addGestureRecognizer(tapGestureUSD)
    }
    
//    @IBAction func didTapLabel(_ sender: UITapGestureRecognizer) {
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: "CurrencyTableViewController") as? CurrencyTableViewController,
//              let label = sender.view as? UILabel else {
//            return
//        }
//        vc.delegate = self
//        tappedLabel = label
//        self.tabBarController?.present(vc, animated: true, completion: nil)
////        self.navigationController?.pushViewController(vc, animated: true)
//    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    @IBAction func tabCalculate(_ sender: Any) {
        
        guard let resultText = resultTextField.text,
              !resultText.isEmpty else { return }
        switch lastEdited {
        case .first:
            if let textUah = uahTextField.text,
               let uah = Double(textUah),
               let price = Double(resultText) {
                usdTextField.text = String(uah / price)
            }
        case .second:
            if let textUsd = usdTextField.text,
               let usd = Double(textUsd),
               let price = Double(resultText) {
                uahTextField.text = String(usd * price)
            }
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let availableSymbols = "0123456789."
        let shouldAllow = availableSymbols.contains(string) || string.isEmpty
        if shouldAllow {
            if textField == uahTextField {
                lastEdited = .first
            } else if textField == usdTextField {
                lastEdited = .second
            }
        }
        return shouldAllow
    }
    
    @IBAction func labelTapped(_ sender: UITapGestureRecognizer) {

        guard let currencyListVC = storyboard?.instantiateViewController(withIdentifier: "CurrencyTableViewController") as? CurrencyTableViewController else {
            return
        }
//        print(label.text)
        currencyListVC.delegate = self
        self.tabBarController?.present(currencyListVC, animated: true, completion: nil)
        let label = sender.view as? UILabel
        tappedLabel = label
    }
}
extension CurrencyConvertViewController: CurrencyTableViewControllerDelegate {
    func currencySelected(currency: String) {
        print(currency)
        tappedLabel?.text = currency
    }
}

