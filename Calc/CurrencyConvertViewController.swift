//
//  CurrencyConvertViewController.swift
//  Calc
//
//  Created by Andrey Boyko on 04.07.2021.
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
    @IBOutlet weak var selectedCurencyTextField: UITextField!
    
    var currencyPicker = UIPickerView()
    var lastEdited: LastEditedField = .first
    var tappedLabel: UILabel?
    var array: [Currency] = [] {
        didSet {
            updateSelectedCurrency(with: array.first)
        }
    }
    var selectedCurrency: Currency? {
        didSet {
            DispatchQueue.main.async {
                self.updateLabels()
            }
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [uahTextField,usdTextField].forEach({ $0?.delegate = self })
        print("array: ___________________________\(array)")
        getCurrency()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        selectedCurencyTextField.inputView = currencyPicker
    }
    
    // MARK: - Actions
    @IBAction func tabCalculate(_ sender: Any) {
        guard selectedCurrency != nil else {
            let alertController = UIAlertController(title: "Error", message: "Please select currency", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(okAction)
            self.tabBarController?.present(alertController, animated: true, completion: nil)
            return
        }
//        guard let resultText = resultTextField.text,
//              !resultText.isEmpty else { return }
        switch lastEdited {
        case .first:
            if let textUah = uahTextField.text,
               let uah = Double(textUah),
               let price = Double(selectedCurrency?.buy ?? "") {
                usdTextField.text = String(uah / price)
                resultTextField.text = selectedCurrency?.buy
            }
        case .second:
            if let textUsd = usdTextField.text,
               let usd = Double(textUsd),
               let price = Double(selectedCurrency?.sale ?? "") {
                uahTextField.text = String(usd * price)
                resultTextField.text = selectedCurrency?.sale

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
    
    //MARK: - Helpers
    
    func updateSelectedCurrency(with selected: Currency?) {
        selectedCurrency = selected
    }
    
    func getCurrency () {
        guard let url = URL(string: "https://api.privatbank.ua/p24api/pubinfo?exchange&json&coursid=11") else {
            return
        }
        let session = URLSession.shared
        session.dataTask(with: url) { [self] (data, response, error) in
            guard let response = response,
                  let data = data else { return }
            print(response)
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
    }
    func updateLabels() {
        selectedCurencyTextField.text = "\(selectedCurrency?.baseCurencyName ?? "") - \(selectedCurrency?.currencyName ?? "")"
        firstLabel.text = selectedCurrency?.baseCurencyName
        secondLabel.text = selectedCurrency?.currencyName
    }
}

//MARK: - CurrencyTableViewControllerDelegate

extension CurrencyConvertViewController: CurrencyTableViewControllerDelegate {
    func currencySelected(currency: String) {
        print(currency)
        tappedLabel?.text = currency
    }
}

//MARK: - UIPickerViewDataSource UIPickerViewDelegate

extension CurrencyConvertViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(array[row].baseCurencyName) - \(array[row].currencyName)"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCurrency = array[row]
        selectedCurencyTextField.resignFirstResponder()
        
    }
}
