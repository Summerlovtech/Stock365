//
//  QuoteShort.swift
//  Stock365
//
//  Created by Summer Lin on 4/10/22.
//

import Foundation

class StockModel{
    init(_ name : String, _ symbol : String){
        self.name = name
        self.symbol = symbol
        }
    var name : String = ""
    var symbol : String = ""
    var price : Float = 0.0
    var dayHigh : Float = 0.0
    var dayLow : Float = 0.0
}

