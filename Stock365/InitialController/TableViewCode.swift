//
//  TableViewCode.swift
//  Stock365
//
//  Created by Summer Lin on 4/10/22.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("StockTableViewCell", owner: self, options: nil)?.first as! StockTableViewCell
        
//        cell.textLabel?.text = "\(stocks[indexPath.row].symbol)  : \(stocks[indexPath.row].price)"
        cell.symbol = stocks[indexPath.row].symbol
        cell.lblStockSymbol.text = stocks[indexPath.row].symbol
        cell.lblCompanyName.text = stocks[indexPath.row].name
        cell.sendStockPriceDelegate = self
        return cell
    }

}




