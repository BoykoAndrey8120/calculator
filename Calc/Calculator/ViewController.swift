//
//  ViewController.swift
//  Calc
//
//  Created by Andrey Boyko on 19.06.2021.
//

import UIKit

enum Operation: String {
    case plus = "+"
    case minus = "-"
    case multiply = "*"
    case devide = "/"
    case percent = "%"
    
    func getArithmeticExpression(left: ArithmeticExpression, right: ArithmeticExpression) -> ArithmeticExpression {
        switch self {
        case .plus:
            return .add(left, right)
        case .minus:
            return .subtract(left, right)
        case .multiply:
            return .multiply(left, right)
        case .devide:
            return .divide(left, right)
        case .percent:
            return .percent(left, right)
        }
    }
}

indirect enum ArithmeticExpression {
    case number(Double)
    case add(ArithmeticExpression, ArithmeticExpression)
    case subtract(ArithmeticExpression, ArithmeticExpression)
    case multiply(ArithmeticExpression, ArithmeticExpression)
    case divide(ArithmeticExpression, ArithmeticExpression)
    case percent(ArithmeticExpression, ArithmeticExpression)
    
    func evaluate() -> Double {
        switch self {
        case let .number(value):
            return value
        case let .add(left, right):
            return left.evaluate() + right.evaluate()
        case let .subtract(left, right):
            return (left.evaluate() - right.evaluate())
        case let .multiply(left, right):
            return (left.evaluate() * right.evaluate())
        case let .divide(left, right):
            return left.evaluate() / right.evaluate()
        default:
            break
        }
        return 0
    }
}
class ViewController: UIViewController {
    
    @IBOutlet weak var button1: NeomorpgButton!
    @IBOutlet weak var inputLebel: UILabel!
    @IBOutlet weak var result: UILabel!
    var expresion: ArithmeticExpression?
    var leftNumber: String = ""
    var rightNumber: String = ""
    var operation: String = ""
    var point: Bool = false
    
    
    //MARK: - LifeCyvle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: - Helpers
    @IBAction func buttenTaped(_ sender: Any) {
        guard let button = sender as? UIButton,
              let text = button.titleLabel?.text else { return }
        
        switch text {
        case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0":
            if inputLebel.text == "0" {
                inputLebel.text = text
            } else {
                inputLebel.text?.append(text)
            }
        case ".":
            if  text == "." && point == false {
                inputLebel.text?.append(text)
                point = true
            }
        case "+", "-", "*", "/", "%":
            guard let inputText = inputLebel.text,
                  let num = Double(inputText),
                  let arOperation = Operation(rawValue: text) else { return }
            inputLebel.text = text
            point = false
            
            switch arOperation {
            case .plus:
                self.expresion = arOperation.getArithmeticExpression(left: .number(num), right: expresion ?? .number(0))
            case .minus:
                    self.expresion = arOperation.getArithmeticExpression(left: expresion ?? .number(num),
                                                                         right: expresion != nil ? .number(num) : .number(0))
            case .multiply:
                self.expresion = arOperation.getArithmeticExpression(left: expresion ?? .number(1), right: .number(num))
            case .devide:
                self.expresion = arOperation.getArithmeticExpression(left: .number(num), right:expresion ?? .number(1))
            case .percent:
                self.expresion = arOperation.getArithmeticExpression(left: expresion ?? .number(0), right: .number(num))
            }

            inputLebel.text = "0"
            self.operation = text
            //calculate()
        case "=":
            guard let inputText = inputLebel.text,
                  let num = Double(inputText),
                  let arOperation = Operation(rawValue: self.operation) else { return }
            
            point = false
            inputLebel.text = "0"
            if text == "*" || text == "/" {
                self.expresion = arOperation.getArithmeticExpression(left: .number(num), right: expresion ?? .number(1) )
            } else if text == "-" {
                self.expresion = arOperation.getArithmeticExpression(left: expresion ?? .number(num), right: .number(num))
            } else {
                self.expresion = arOperation.getArithmeticExpression(left: expresion ?? .number(0), right: .number(num))
            }
            calculate()

        case "С":
            inputLebel.text = "0"
            leftNumber = "0"
            self.result.text = "0"
            self.expresion = nil
            break
        default:
            break
        }
        
    }

    func calculate() {
        self.result.text = String(expresion!.evaluate())
    }
}

