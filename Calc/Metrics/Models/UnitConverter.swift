//
//  LenghtConverter.swift
//  Calc
//
//  Created by Andrey Boyko on 03.08.2021.
//

import Foundation


class UnitConverter {
    static let shared = UnitConverter()
    
    private init() {
        
    }
    func convert<T: ToBaseConvertable>(from fromUnit: Unit, to unitType: T) -> Double {
        let meters = fromUnit.value * fromUnit.unitType.toBase()
        return convertFromMeters(from: meters, to: unitType)
    }
    func convertToMeters(from len: Unit) -> Double {
        return len.value * len.unitType.toBase()
    }
    func convertFromMeters<T: ToBaseConvertable>(from: Double, to unit: T) -> Double {
        return from * unit.fromBase()
    }
}
