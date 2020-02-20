//
//  StockActivityVC.swift
//  Trade
//
//  Created by Anshul on 01/02/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit

struct StockActivtyModel {
    let date: String
    let maturityType: String
    let deduction: String
    let depositType: String
}

class StockActivityVC: UIViewController {
    @IBOutlet weak var tabeleViewActivity: UITableView!
    let list = [StockActivtyModel(date: "12/03/2019", maturityType: "Deposit", deduction: "-4.80", depositType: "Standard Bank Deposit"),StockActivtyModel(date: "12/03/2019", maturityType: "Deposit", deduction: "-4.80", depositType: "Interest"),StockActivtyModel(date: "12/03/2019", maturityType: "Deposit", deduction: "-4.80", depositType: "Standard Bank Deposit"),StockActivtyModel(date: "12/03/2019", maturityType: "Deposit", deduction: "-4.80", depositType: "Interest"),StockActivtyModel(date: "12/03/2019", maturityType: "Reinvest Interest", deduction: "-4.80", depositType: "Standard Bank Deposit")
          ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tabeleViewActivity.delegate = self
        tabeleViewActivity.dataSource = self
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

extension StockActivityVC : UITableViewDelegate{
    
}

extension StockActivityVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockActivityListCell", for: indexPath) as! StockActivityListCell
                  cell.configureCell(model: list[indexPath.row])
                  cell.selectionStyle = .none
                  return cell
    }
    
    
}
