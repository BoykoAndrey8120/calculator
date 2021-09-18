//
//  GeometryDataGenerator.swift
//  Calc
//
//  Created by Andrey Boyko on 17.08.2021.
//

import Foundation


class GeometryDataGenerator {
    static let shared = GeometryDataGenerator()
    
    private init() {
        
    }
    
    func createData() -> [Figure] {
        //rectangle
        let rectAreaFields = [FieldInfo(name: "a", value: 3), FieldInfo(name: "b", value: 0)]
        let rectAreaFormula = Formula(name: "RectSquareFormula", shotName: "Area",  fields: rectAreaFields, formula: "a*b")
        let rectPerimeterFields = [FieldInfo(name: "a", value: 3), FieldInfo(name: "b", value: 4)]
        let rectPerimeterFormula = Formula(name: "RectSquareFormula", shotName: "Perimeter", fields: rectPerimeterFields, formula: "(a+b) * 2")
        let rect = Figure(name: "Rectangle", imageName: "rectangle", formulas: [rectAreaFormula,rectPerimeterFormula])
        //Square
        let squareAreaFields = [FieldInfo(name: "a", value: 3)]
        let squareAreaFormula = Formula(name: "squareAreaFormula", shotName: "Area", fields: squareAreaFields, formula: "a**2")
        let squarePerimeterFields = [FieldInfo(name: "a", value: 3)]
        let squarePerimeterFormula = Formula(name: "squarePerimeterFormula", shotName: "Perimeter", fields: squarePerimeterFields, formula: "a * 4")
        let square = Figure(name: "Square", imageName: "square", formulas: [squarePerimeterFormula,squareAreaFormula])
        
        //Circle
        let circleAreaFields = [FieldInfo(name: "r", value: 3),FieldInfo(name: "pi", value: 3.14)]
        let circleAreaFormula = Formula(name: "circleAreaFormula", shotName: "Area", fields: circleAreaFields, formula: "pi*r**2")
        let circleLenghtFields = [FieldInfo(name: "r", value: 3), FieldInfo(name: "pi", value: 3.14)]
        let circleLenghtFormula = Formula(name: "circleLenghtFormula", shotName: "Lenght", fields: circleLenghtFields, formula: "2*pi*r")
        let circle = Figure(name: "Circle", imageName: "circle", formulas: [circleAreaFormula,circleLenghtFormula])
        
        //triangle
        let equilateralTriangleAreaFields = [FieldInfo(name: "a", value: 3), FieldInfo(name: "sqrt", value: sqrt(3))]
        let equilateralTriangleAreaFieldsFormula = Formula(name: "equilateralTriangleArea", shotName: "Area", fields: equilateralTriangleAreaFields, formula: "(sqrt/4)*a**2")
        let triangle = Figure(name: "Triangle", imageName: "triangle", formulas: [equilateralTriangleAreaFieldsFormula])
        
        return [rect,square,circle,triangle]
    }
}





