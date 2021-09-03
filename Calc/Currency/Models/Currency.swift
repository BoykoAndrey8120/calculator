//
//  Currency.swift
//  Calc
//
//  Created by Andrey Boyko on 03.09.2021.
//

struct Currency: Codable {
    
    enum CodingKeys: String, CodingKey {
        case baseCurencyName = "base_ccy"
        case buy
        case currencyName = "ccy"
        case sale
    }
    
    var baseCurencyName: String
    var buy: String
    var currencyName: String
    var sale: String
}
