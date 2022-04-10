//
//  ProtocolSendStockData.swift
//  Stock365
//
//  Created by Summer Lin on 4/10/22.
//

import Foundation

protocol SendStockDelegate {
    func sendStockData(_ stockPriceModel : StockModel)
}
