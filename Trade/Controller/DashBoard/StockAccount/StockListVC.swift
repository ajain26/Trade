//
//  StockListVC.swift
//  Trade
//
//  Created by Anshul on 01/02/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit

class StockListVC: UIViewController {
    @IBOutlet weak var tableviewList: UITableView!
    let sensexPriceList:[SensexPrice] = [SensexPrice(title: "Apple", price: "25.60", decrementPoint: "-3.10", decrementPrice: "263.19", lastmonth: "+4.85%", threemonth: "+4.85%", qtd: "+6.85%", ytd: "24.85"),
           SensexPrice(title: "Uber", price: "22.60", decrementPoint: "-1.10", decrementPrice: "269.19", lastmonth: "+3.85%", threemonth: "+4.85%", qtd: "+6.85%", ytd: "24.85"),
           SensexPrice(title: "Google", price: "20.60", decrementPoint: "-2.10", decrementPrice: "269.19", lastmonth: "+3.85%", threemonth: "+4.85%", qtd: "+6.85%", ytd: "24.85")
       ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewList.delegate = self
        tableviewList.dataSource = self


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension StockListVC : UITableViewDelegate{
    
}

extension StockListVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sensexPriceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SensexPriceCell", for: indexPath) as! SensexPriceCell
                  cell.configureCell(model: sensexPriceList[indexPath.row])
                  cell.selectionStyle = .none
                  return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        164
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       tableView.dequeueReusableCell(withIdentifier: "cell")
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
             let modifyAction = UIContextualAction(style: .normal, title:  "Trade", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                   let tradevc = self.storyboard?.instantiateViewController(identifier: "TradeVC") as! TradeVC
                   self.present(tradevc, animated: true, completion: nil)
                   success(true)
               })
               modifyAction.backgroundColor = UIColor().hexStringToUIColor(hex: "#0176DD")
       //            UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.0)
               return UISwipeActionsConfiguration.init(actions: [modifyAction])
               }
    
}
