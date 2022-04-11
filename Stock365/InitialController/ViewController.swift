//
//  ViewController.swift
//  Stock365
//
//  Created by Summer Lin on 4/10/22.
//

import UIKit

class ViewController: UIViewController, SendStockDelegate{
    
    func sendStockData(_ stockPriceModel: StockModel) {
        print(stockPriceModel)
        lblCompanyName.text = stockPriceModel.name
        lblSymbol.text = stockPriceModel.symbol
        lblPrice.text = "Stock Price: \(stockPriceModel.price) $"
        lblDayHigh.text = "Day High: \(stockPriceModel.dayHigh) $"
        lblDayLow.text = "Day Low: \(stockPriceModel.dayLow) $"
    }
    

    @IBOutlet weak var lblCompanyName: UILabel!
    
    @IBOutlet weak var lblSymbol: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblDayLow: UILabel!
    
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var lblDayHigh: UILabel!
    
    let stockArr = ["FB", "AAPL", "AMZN", "MSFT", "GOOG" ]
    
    var stocks : [StockModel] = [StockModel]()
    
    func initializeStocks() -> [StockModel]{
            let facebook = StockModel("Facebook", "FB");
            let apple = StockModel("Apple Inc", "AAPL");
            let amazon = StockModel("Amazon", "AMZN");
            let microsoft = StockModel("Microsoft", "MSFT");
            let google = StockModel("Google", "GOOG");

            var modelArr = [StockModel]()
            
            modelArr.append(facebook)
            modelArr.append(apple)
            modelArr.append(amazon)
            modelArr.append(microsoft)
            modelArr.append(google)

            return modelArr
        }
    
//    func getStockData(_ stockModel: StockModel) {
//        lblCompanyName.text = stockModel.name
//        lblSymbol.text = stockModel.symbol
//        lblPrice.text = "Stock Price: \(stockModel.price) $"
//        lblDayHigh.text = "Day High: \(stockModel.dayHigh) $"
//        lblDayLow.text = "Day Low: \(stockModel.dayLow) $"
//        }
    
   // var stockData : [StockModel] = []()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getStockValue()
                
        stocks = initializeStocks()
        
    }
    
   
    @IBAction func addStocksAction(_ sender: Any) {
        var txtField : UITextField?
        
        let alertController = UIAlertController(title: "Add Stock", message: "", preferredStyle: .alert)
             
                let OKButton = UIAlertAction(title: "OK", style: .default) { action in
                    guard let symbol = txtField?.text else {return}

                    let newStockURL = getStockURL(symbol.trimmingLeadingAndTrailingSpaces().uppercased())
                    getStockData(newStockURL).done { stockPriceModel in
                        if (stockPriceModel.symbol == "") {
                            return
                        }
                        let newStock = StockModel(stockPriceModel.name,stockPriceModel.symbol)
                        self.stocks.append(newStock)
                        self.tblView.reloadData()
                    }
                    .catch { error in
                        print("in getStockPriceAction \(error.localizedDescription)")
                    }
                }
                let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { action in
                    
                }
                alertController.addAction(OKButton)
                alertController.addAction(cancelButton)
                
                alertController.addTextField { stockTextField in
                    stockTextField.placeholder = "Type Stock Symbol"
                    txtField = stockTextField
                }
                
                self.present(alertController, animated: true, completion: nil)
                
    }
    
    

}

