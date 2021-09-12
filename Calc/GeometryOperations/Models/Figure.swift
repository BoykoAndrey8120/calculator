//
//  Figure.swift
//  Calc
//
//  Created by Andrey Boyko on 09.08.2021.
//

import Foundation

enum FigureEnum: String, CaseIterable {
    case Square
    case Triangle
    case Rectangle
    case Circle
    
}
class Figure {

    var name: String
    var imageName: String
    var formulas: [Formula]
    init(name: String, imageName: String, formulas: [Formula]) {
        self.imageName = imageName
        self.formulas = formulas
        self.name = name
    }
}
class Formula {
    enum nameOfFormula: String {
        case Square = "Square"
        case Area = "Area"
        case Lenght = "Lenght"
    }
    var name: String
    var shotName: String
    var fields: [FieldInfo]
    var formula: String

    init(name: String, shotName: String, fields: [FieldInfo], formula: String) {
        self.name = name
        self.shotName = shotName
        self.fields = fields
        self.formula = formula
    }

    func replaceSymbolsByValues() -> String? {
        var result = formula.lowercased()
        for field in fields {
            result = result.replacingOccurrences(of: field.name,
                                                 with: String(field.value))
        }

        return result
    }

    func calculate() -> Double? {
        guard let stringFormula = replaceSymbolsByValues() else { return nil }

        return NSExpression(format: stringFormula).expressionValue(with: nil, context: nil) as? Double
    }
}

class FieldInfo {
    init(name: String, value: Double) {
        self.name = name
        self.value = value
        
    }
    
    let name: String
    var value: Double
}

//class TriangleArea: Formula {
//    var name: String
//    var fields: [FieldInfo]
//    var sideOfSquare: FieldInfo// = FieldInfo(name: "Side of a square", value: 0)
////    var squareArea: FieldInfo// = FieldInfo(name: "Square area", value: 0)
//
//    init(name: String, sideOfSquare: FieldInfo) {
//        self.name = name
//        self.fields = [sideOfSquare]
//        self.sideOfSquare = sideOfSquare
////        self.squareArea = squareArea
//    }
//    // s = a * a
//    // p = a * 4
//
//    //rectangle
//    // s = a * b
//    // p = (a + b) * 2
//    func calculate() -> Double {
//        print(name.self)
////        squareArea.value =
////        let result = squareArea.value
//        return sideOfSquare.value * sideOfSquare.value
//    }
//}
//
//class SquareArea: Formula {
//    var name: String
//    var fields: [FieldInfo]
//    var sideOfSquare: FieldInfo// = FieldInfo(name: "Side of a square", value: 0)
////    var squareArea: FieldInfo// = FieldInfo(name: "Square area", value: 0)
//    
//    init(name: String, sideOfSquare: FieldInfo) {
//        self.name = name
//        self.fields = [sideOfSquare]
//        self.sideOfSquare = sideOfSquare
////        self.squareArea = squareArea
//    }
//    // s = a * a
//    // p = a * 4
//    
//    //rectangle
//    // s = a * b
//    // p = (a + b) * 2
//    func calculate() -> Double {
//        print(name.self)
////        squareArea.value =
////        let result = squareArea.value
//        return sideOfSquare.value * sideOfSquare.value
//    }
//}

