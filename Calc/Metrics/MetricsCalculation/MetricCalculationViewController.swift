//
//  MetricCalculationViewController.swift
//  Calc
//
//  Created by Andrey Boyko on 03.08.2021.
//
import Foundation
import UIKit
enum CalculationType: String, CaseIterable {
    case mass = "Mass"
    case lenght = "Lenght"
    case temp = "Temperature"
}
class MetricCalculationViewController: UIViewController, UITextFieldDelegate {
    
    var metricType = ""
    var calculationType: CalculationType?
    var tapdLabel: UILabel?
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var fristTextField: UITextField!
    
    var lasEditedTextField: UITextField?
    
    
    @IBOutlet weak var calculateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let unit = Unit(unitType: Lenght.kilmeter, value: 1)
        UnitConverter.shared.convert(from: unit, to: Lenght.meter)

        [fristTextField,secondTextField].forEach({ $0?.delegate = self })
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @IBAction func tapLabel(_ sender: UITapGestureRecognizer) {
        guard let metricVC = storyboard?.instantiateViewController(withIdentifier: "MetricCalculationTableViewController") as? MetricCalculationTableViewController else {
            return
        }
        print("tap")
        switch calculationType {
        case .mass:
            metricVC.metrics = Mass.allCases.map { $0.rawValue }
            metricType = "Mass"
        case .lenght:
            metricVC.metrics = Lenght.allCases.map { $0.rawValue }
            metricType = "Lenght"
        case .temp:
            metricVC.metrics = Temperature.allCases.map { $0.rawValue }
            metricType = "Temperature"
            break
        default:
            break
        }
        
        metricVC.delegate = self
        self.tabBarController?.present(metricVC, animated: true, completion: nil)
        let label = sender.view as? UILabel
        tapdLabel = label
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let availableSymbols = "0123456789."
        let shouldAllow = availableSymbols.contains(string) || string.isEmpty
        if shouldAllow {
            lasEditedTextField = textField
        }
        return shouldAllow
    }
    
    @IBAction func calculateTapped(_ sender: Any) {
        
        if metricType == "Lenght" {
        guard  let firstUnit = Lenght(rawValue: firstLabel.text ?? ""),
               let secondUnit = Lenght(rawValue: secondLabel.text ?? ""),
               let firstText = fristTextField.text,
               let secondText = secondTextField.text,
               let firstValue = Double(firstText),
               let secondValue = Double(secondText) else { return }
        switch lasEditedTextField {
        case fristTextField:
            let unit = Unit(unitType: firstUnit, value: firstValue)
            secondTextField.text = String(UnitConverter.shared.convert(from: unit, to: secondUnit))
        case secondTextField:
            let unit = Unit(unitType: secondUnit, value: secondValue)
            fristTextField.text = String(UnitConverter.shared.convert(from: unit, to: firstUnit))
        default:
            return
        }
        }
        if metricType == "Mass" {
        guard  let firstUnit = Mass(rawValue: firstLabel.text ?? ""),
               let secondUnit = Mass(rawValue: secondLabel.text ?? ""),
               let firstText = fristTextField.text,
               let secondText = secondTextField.text,
               let firstValue = Double(firstText),
               let secondValue = Double(secondText) else { return }
        switch lasEditedTextField {
        case fristTextField:
            let unit = Unit(unitType: firstUnit, value: firstValue)
            secondTextField.text = String(UnitConverter.shared.convert(from: unit, to: secondUnit))
        case secondTextField:
            let unit = Unit(unitType: secondUnit, value: secondValue)
            fristTextField.text = String(UnitConverter.shared.convert(from: unit, to: firstUnit))
        default:
            return
        }
    }
        if metricType == "Temperature" {
        guard  let firstUnit = Temperature(rawValue: firstLabel.text ?? ""),
               let secondUnit = Temperature(rawValue: secondLabel.text ?? ""),
               let firstText = fristTextField.text,
               let secondText = secondTextField.text,
               let firstValue = Double(firstText),
               let secondValue = Double(secondText) else { return }
        switch lasEditedTextField {
        case fristTextField:
            let unit = Unit(unitType: firstUnit, value: firstValue)
            secondTextField.text = String(UnitConverter.shared.convert(from: unit, to: secondUnit))
        case secondTextField:
            let unit = Unit(unitType: secondUnit, value: secondValue)
            fristTextField.text = String(UnitConverter.shared.convert(from: unit, to: firstUnit))
        default:
            return
        }
    }
    
    
}
}
        extension MetricCalculationViewController: MetricCalculationTableViewControllerDelegate {
            func metricCalculation(metric: String) {
                print(metric)
                tapdLabel?.text = metric
            }
}

