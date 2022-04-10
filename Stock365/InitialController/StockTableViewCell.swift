//
//  StockTableViewCell.swift
//  Stock365
//
//  Created by Summer Lin on 4/10/22.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCompanyName: UILabel!
    var companyName = ""
    
    @IBOutlet weak var lblStockSymbol: UILabel!
    var stockSymbol = ""
    
    var sendStockPriceDelegate : SendStockDelegate?
    var symbol = ""
    //    @IBAction func getPrice(_ sender: Any) {
//
//        let currentURL = getStockURL(stockPriceURL)
//
//        getStockData(currentURL)
//        .done { stockModel in
//            self.sendStockPriceDelegate?.sendStockData(stockModel)
//        }
//        .catch { error in
//            print(error.localizedDescription)
//        }
//    }
    

    @IBAction func getPriceAction(_ sender: Any) {
                
        let currentURL = getStockURL(symbol)
       
               getStockData(currentURL)
               .done { stockModel in
                   print(stockModel)
                   self.sendStockPriceDelegate?.sendStockData(stockModel)
               }
               .catch { error in
                   print(error.localizedDescription)
               }
    }
    
}
