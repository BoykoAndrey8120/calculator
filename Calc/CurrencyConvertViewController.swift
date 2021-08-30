//
//  CurrencyConvertViewController.swift
//  Calc
//
//  Created by Andrey Boyko on 04.07.2021.


struct Currency: Codable {
    var base_ccy: String
    var buy: String
    var ccy: String
    var sale: String
}

import Foundation
import UIKit
enum LastEditedField {
    case first
    case second
}

class CurrencyConvertViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var uahTextField: UITextField!
    @IBOutlet weak var usdTextField: UITextField!
    @IBOutlet weak var resultTextField: UITextField!
    var lastEdited: LastEditedField = .first
    var tappedLabel: UILabel?
    var array: [Currency] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        [uahTextField,usdTextField].forEach({ $0?.delegate = self })
        print("array: ___________________________\(array)")
        func getCurrency () -> String {
            guard let url = URL(string: "https://api.privatbank.ua/p24api/pubinfo?exchange&json&coursid=11") else { return "" }
            let session = URLSession.shared
            session.dataTask(with: url) { [self] (data, response, error) in
                if let response = response {
                    print(response)
                }
                guard let data = data else { return }
                do {
                    let currencyOfBank: [Currency] = try JSONDecoder().decode([Currency].self, from: data)
                    print(currencyOfBank)
                    array = currencyOfBank
                    return
                }
                catch {
                    print(error)
                }
            } .resume()
            return ""
        }
        getCurrency()
    }
    
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
                print("array: ___________________________\(array)")
                print("buy--------------------------------------------------")
               
            }
        case .second:
            if let textUsd = usdTextField.text,
               let usd = Double(textUsd),
               let price = Double(resultText) {
                print("array: ___________________________\(array)")
                print("buy--------------------------------------------------")
               
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let availableSymbols = "0123456789."
        let shouldAllow = availableSymbols.contains(string) || string.isEmpty
        if shouldAllow {
            if textField == uahTextField {
                lastEdited = .first
                array.map({if firstLabel?.text == $0.ccy {resultTextField.text = $0.buy}})
            } else if textField == usdTextField {
                lastEdited = .second
                array.map({if secondLabel?.text == $0.ccy {resultTextField.text = $0.buy}})
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
