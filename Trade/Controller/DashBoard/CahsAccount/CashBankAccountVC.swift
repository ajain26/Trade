//
//  CashBankAccountVC.swift
//  Trade
//
//  Created by Anshul on 11/01/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit

struct  BankAccountModel {
    let name: String
    let accountType: String
    let accountNo: String
    let routingNo: String
}

class CashBankAccountVC: UIViewController {
    
    @IBOutlet weak var tabelviewAccount: UITableView!
    
    let listBankAccount = [BankAccountModel(name: "SWISS Bank", accountType: "Saving Account", accountNo: "Account No. - XXXX XXXX 0099", routingNo: "Routing No. - Swiss0099"), BankAccountModel(name: "HSBC Bank", accountType: "Saving Account", accountNo: "Account No. - XXXX XXXX 0457", routingNo: "Routing No. - Hsbc000055")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelviewAccount.delegate = self
        tabelviewAccount.dataSource = self
        tabelviewAccount.separatorStyle = .none
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

extension CashBankAccountVC: UITableViewDelegate{
    
}

extension CashBankAccountVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listBankAccount.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BankAccountDefaultCell")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        178
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        178
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BankAccountSummeryFooterCell") as! BankAccountSummeryFooterCell
        cell.plusButtonClicked =  {
            let vc = self.storyboard?.instantiateViewController(identifier: "AddNewBankVC")
            self.present(vc!, animated: true, completion: nil)
        }
               return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BankAccountSummeryCell", for: indexPath) as! BankAccountSummeryCell
        cell.configureCell(listBankAccount[indexPath.row])
        return cell
    }
    
    
}
