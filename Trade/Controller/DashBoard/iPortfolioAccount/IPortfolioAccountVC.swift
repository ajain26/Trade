//
//  IPortfolioAccountVC.swift
//  Trade
//
//  Created by Anshul on 28/01/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit
import Charts
struct Services {
    let title: String
    let serviceprice: String
    let servicepoints: String
    let graphXaxis = ["10k", "50k", "80k", "100k"]
}

struct SensexPrice {
    let title: String
    let price: String
    let decrementPoint: String
    let decrementPrice: String
    let lastmonth: String
    let threemonth: String
    let qtd: String
    let ytd: String

}

struct  IportfolioModel {
    let servicesList:[Services] = [Services(title: "iPortfolio - Financial Services", serviceprice: "$24,256.90", servicepoints: "+2.45(+0.25%)"), Services(title: "iPortfolio - ABC Services", serviceprice: "$33,743", servicepoints: "+2.45(+0.25%)")]
    let sensexPrice:[SensexPrice] = [SensexPrice(title: "Apple", price: "25.60", decrementPoint: "-3.10", decrementPrice: "263.19", lastmonth: "+4.85%", threemonth: "+4.85%", qtd: "+6.85%", ytd: "24.85"),
        SensexPrice(title: "Uber", price: "22.60", decrementPoint: "-1.10", decrementPrice: "269.19", lastmonth: "+3.85%", threemonth: "+4.85%", qtd: "+6.85%", ytd: "24.85"),
        SensexPrice(title: "Google", price: "20.60", decrementPoint: "-2.10", decrementPrice: "269.19", lastmonth: "+3.85%", threemonth: "+4.85%", qtd: "+6.85%", ytd: "24.85")
    ]
}

class IPortfolioAccountVC: UIViewController {
   
    @IBOutlet weak var tabelViewPortfolio: UITableView!
    var dataList = IportfolioModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tabelViewPortfolio.delegate = self
        tabelViewPortfolio.dataSource = self
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  @IBAction  func createIPortFolioVC(){
   let createPortfolioVC = self.storyboard?.instantiateViewController(identifier: "CreatePortfolioVC") as! CreatePortfolioVC
    self.present(createPortfolioVC, animated: true, completion: nil)
    }

}

extension IPortfolioAccountVC {
    @IBAction func backButtonClicked(){
        self.navigationController?.popViewController(animated: false)
    }
}

extension IPortfolioAccountVC: UITableViewDelegate {
   
}

extension IPortfolioAccountVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        [1,dataList.servicesList.count, dataList.sensexPrice.count][section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
         3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = self.tabelViewPortfolio.dequeueReusableCell(withIdentifier: "IPortfolioDashBoardCell", for: indexPath) as! IPortfolioDashBoardCell
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 1 {
            let cell = self.tabelViewPortfolio.dequeueReusableCell(withIdentifier: "PortFolioServiceCell", for: indexPath) as! PortFolioServiceCell
            cell.configureCell(model: dataList.servicesList[indexPath.row])
            cell.buyButtonHandler = { self.navigateToBuyController()}
            cell.selectionStyle = .none
            return cell
        }
        else{
            let cell = self.tabelViewPortfolio.dequeueReusableCell(withIdentifier: "SensexPriceCell", for: indexPath) as! SensexPriceCell
            cell.configureCell(model: dataList.sensexPrice[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
    }
//    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String?
//    {
//         return "Trade"
//    }
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//           if editingStyle == .delete {
//            let tradevc = self.storyboard?.instantiateViewController(identifier: "TradeVC") as! TradeVC
//            self.present(tradevc, animated: true, completion: nil)
//        }
//
//    }
    
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
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle
    {
        [.none, .none, .delete][indexPath.section]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      //  cell
           let cell = self.tabelViewPortfolio.dequeueReusableCell(withIdentifier: "cell")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        [434, 400, 164][indexPath.section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        [0.0,0.0,54][section]
    }
}

extension IPortfolioAccountVC {
    func navigateToBuyController(){
        let storyboard = self.storyboard?.instantiateViewController(identifier: "BuyPortfolioVC") as! BuyPortfolioVC
        self.navigationController?.pushViewController(storyboard, animated: false)
    }
}
