//
//  TradeVC.swift
//  Trade
//
//  Created by Anshul on 01/02/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit

class TradeVC: UIViewController {
    @IBOutlet weak var txtAccountType: UITextField!
    @IBOutlet weak var txtAccountNickName: UITextField!
    @IBOutlet weak var txtAccountNumber: UITextField!
    @IBOutlet weak var txtRountingNumber: UITextField!
    @IBOutlet weak var buttonAccount: UIButton!
    @IBOutlet var subView: [UIView]!
    @IBOutlet weak var dropDownTextField: DropDownTextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.customize(subView[0])
        self.customize(subView[1])
        self.customize(subView[2])
        self.customize(subView[3])
        self.setBuutonLogin(buttonAccount)
        dropDownTextField.loadDropdownData(data:["2"], selectedValue:"2") { value  in
             print(value)
          }
        
        let segmentGrayColor = UIColor(red: 0.889415, green: 0.889436, blue:0.889424, alpha: 1.0 )
                       self.segmentControl?.layer.cornerRadius = 15.0;
                       self.segmentControl?.selectedSegmentTintColor = UIColor(red: 0/255, green: 135/255, blue: 225/255, alpha: 1)
                       segmentControl?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
               segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
                       self.segmentControl?.layer.borderWidth = 0.5;
                       segmentControl?.layer.borderColor = segmentGrayColor.cgColor
                       self.segmentControl?.layer.masksToBounds = true;
            
        
        
        // Do any additional setup after loading the view.
    }
    func setBuutonLogin(_ button: UIButton){
        button.setTitleColor(.white, for: .normal)
        button.roundCorners(corners: [.bottomLeft, .bottomRight, .topLeft, .topRight], radius: 15.0)
        button.backgroundColor = UIColor().hexStringToUIColor(hex: "#0176DD")
        button.setTitle("Trade", for: .normal)
    }
    @IBAction func crossCliced(){
        self.dismiss(animated: true) {

        }
    }
    
    func customize(_ subView: UIView) {
           subView.roundCorners(corners: [.bottomLeft, .bottomRight, .topLeft, .topRight], radius: 15.0)
           subView.backgroundColor = UIColor.lightGray
        subView.backgroundColor = UIColor().hexStringToUIColor(hex: "#F3F3F4")
           subView.layer.masksToBounds = true
           subView.clipsToBounds = true
       }
}
