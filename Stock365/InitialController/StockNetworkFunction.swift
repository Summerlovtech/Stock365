//
//  StockNetworkFunction.swift
//  Stock365
//
//  Created by Summer Lin on 4/10/22.
//

import Foundation
import Alamofire
import SwiftyJSON
import SwiftSpinner
import  PromiseKit

func getStockURL(_ symbol : String) -> String{
    let url = "\(stockPriceURL)\(symbol)?apikey=\(apiKey)"
    return url
}
    
func getStockData(_ url : String) ->Promise<StockModel>{
    return Promise<StockModel> { seal -> Void in
        print(url)
        AF.request(url).responseJSON { response in
            
            if response.error != nil {
                seal.reject(response.error!)
                return
            }
            let stockModel = StockModel("", "")
            let stocks = JSON(response.data!).arrayValue
            
            guard let stock = stocks.first else {return seal.fulfill(stockModel)}
          
            stockModel.name = stock["name"].stringValue
            stockModel.symbol = stock["symbol"].stringValue
            stockModel.price = stock["price"].floatValue
            stockModel.dayHigh = stock["dayHigh"].floatValue
            stockModel.dayLow = stock["dayLow"].floatValue
            print(stockModel)

            seal.fulfill(stockModel) // I am fulfilling the promise
        } // end of AF request
    } // end of return promise

}

