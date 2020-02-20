//
//  CashSummeryVC.swift
//  Trade
//
//  Created by Anshul on 11/01/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit

struct CashSummery {
    let value: String
    let avlBal: String
    let status: String
    let date: String
}

class CashSummeryVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var searchActive : Bool = false

    @IBOutlet weak var tabelFundTransfer: UITableView!
    @IBOutlet weak var buttonFunnTransfer: UIButton!
    @IBOutlet weak var searchTransictionBar: UISearchBar!
    @IBOutlet weak var lblAvailableCash: UILabel!
    let cashSummeryList = [CashSummery(value: "1000", avlBal: "490001", status: "Debit", date: "06/12/2019"),CashSummery(value: "2000", avlBal: "480001", status: "Debit", date: "06/12/2019"),CashSummery(value: "-2500", avlBal: "460001", status: "Credit", date: "07/12/2019"),CashSummery(value: "3000", avlBal: "490001", status: "credit", date: "07/12/2019"),CashSummery(value: "1000", avlBal: "490001", status: "Debit", date: "06/12/2019"),CashSummery(value: "2000", avlBal: "490001", status: "Debit", date: "06/12/2019"),CashSummery(value: "1000", avlBal: "490001", status: "Debit", date: "06/12/2019"),CashSummery(value: "1000", avlBal: "490001", status: "Debit", date: "06/12/2019"),CashSummery(value: "5000", avlBal: "390001", status: "crdit", date: "08/12/2019"),CashSummery(value: "-1200", avlBal: "38551", status: "Debit", date: "06/12/2019")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelFundTransfer.delegate = self
        tabelFundTransfer.dataSource = self
        buttonFunnTransfer.setTitleColor(.white, for: .normal)
        buttonFunnTransfer.roundCorners(corners: [.bottomLeft, .bottomRight, .topLeft, .topRight], radius: 15.0)
        buttonFunnTransfer.backgroundColor = UIColor().hexStringToUIColor(hex: "#0176DD")
        buttonFunnTransfer.setTitle("Fund Transfer", for: .normal)
        // Do any additional setup after loading the view.
    }
    @IBAction func fundTransferClicked(){
             let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
             // Instantiate View Controller
             let viewController = storyboard.instantiateViewController(withIdentifier: "FundTransferVC") as! FundTransferVC
            self.present(viewController, animated: true, completion: nil)
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
extension CashSummeryVC: UITableViewDelegate{
    
    
}

extension CashSummeryVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CashSumeryheader")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cashSummeryList.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CashSumeryCellID", for: indexPath) as! CashSumeryCell
        cell.updateCell(model: cashSummeryList[indexPath.row])
        return cell
    }
    
    
}
extension CashSummeryVC : UISearchBarDelegate{

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
          searchActive = false
          self.searchBar.endEditing(true)
      }
func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
//    tabelFundTransfer.reloadData()
//    if string.isEmpty {
//               userList = userListOrignal
//           }
//           else {
//               userList =  userListOrignal.filter({($0.username.lowercased().range(of: string.lowercased())) != nil ? true : false})
//           }
    
}

}
