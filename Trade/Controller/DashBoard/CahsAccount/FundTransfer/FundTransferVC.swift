//
//  FundTransferVC.swift
//  Trade
//
//  Created by Anshul on 21/01/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit

class FundTransferVC: UIViewController {
    @IBOutlet weak var txtAccountType: UITextField!
    @IBOutlet weak var dropDowntxtAccountNickName: DropDownTextField!
    @IBOutlet weak var txtAccountNumber: UITextField!
    @IBOutlet weak var txtRountingNumber: UITextField!
    @IBOutlet weak var buttonAccount: UIButton!
    @IBOutlet var subView: [UIView]!
    @IBOutlet weak var dropDownTextField: DropDownTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customize(subView[0])
        self.customize(subView[1])
        self.customize(subView[2])
        self.customize(subView[3])
        self.setBuutonLogin(buttonAccount)
        dropDownTextField.loadDropdownData(data:["getPropser Cash", "Current"], selectedValue:"getPropser Cash Accoun") { value  in
            print(value)
        }
        dropDowntxtAccountNickName.loadDropdownData(data:["SWISS XXXX 0099", "Current"], selectedValue:"SWISS XXXX 0099") { value  in
            print(value)
        }
        // Do any additional setup after loading the view.
    }
    func setBuutonLogin(_ button: UIButton){
        button.setTitleColor(.white, for: .normal)
        button.roundCorners(corners: [.bottomLeft, .bottomRight, .topLeft, .topRight], radius: 15.0)
        button.backgroundColor = UIColor().hexStringToUIColor(hex: "#0176DD")
        button.setTitle("Transfer Funds", for: .normal)
    }
    @IBAction func crossCliced(){
        self.dismiss(animated: true) {

        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func customize(_ subView: UIView) {
           subView.roundCorners(corners: [.bottomLeft, .bottomRight, .topLeft, .topRight], radius: 15.0)
           subView.backgroundColor = UIColor.lightGray
        subView.backgroundColor = UIColor().hexStringToUIColor(hex: "#F3F3F4")
           subView.layer.masksToBounds = true
           subView.clipsToBounds = true
       }
}
