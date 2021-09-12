//
//  Protocols.swift
//  Calc
//
//  Created by Andrey Boyko on 09.08.2021.
//

import Foundation

protocol ToBaseConvertable {
    func toBase() -> Double
    func fromBase() -> Double
}
extension ToBaseConvertable {
    func fromBase() -> Double {
        1 / toBase()
    }
}


enum Lenght: String, ToBaseConvertable, CaseIterable {
    case kilmeter
    case meter
    case santimete
    case mile
    case yard
    case foot
    case inch

    func toBase() -> Double {
        switch self {
        case .kilmeter:
            return 1000
        case .meter:
            return 1
        case .santimete:
            return 0.01
        case .mile:
            return 1609.34
        case .yard:
            return 0.9144
        case .foot:
            return 0.3048
        case .inch:
            return 0.0254
        }
    }
}
enum Mass: String, ToBaseConvertable, CaseIterable {
    
    case kilogram
    case gram
    case ton
    case centner
    case pound
    case ounce
    
    func toBase() -> Double {
        switch self {
        case .kilogram:
            return 1
        case .gram:
            return 0.001
        case .ton:
            return 1000
        case .centner:
            return 100
        case .pound:
            return 0.45359237
        case .ounce:
            return 0.0283495231
        }
    }
}
enum Temperature: String, ToBaseConvertable, CaseIterable {
    case celsius
    case fahrenheit
    case kelvin
    case newton
    
    func toBase() -> Double {
        switch self {
        case .celsius:
            return 1
        case .fahrenheit:
            return 33.8
        case .kelvin:
            return 274.15
        case .newton:
            return 0.33
        }
    }
}
