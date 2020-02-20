//
//  BankAccountCell.swift
//  Trade
//
//  Created by Anshul on 18/01/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit

class BankAccountDefaultCell: UITableViewCell {
    
    @IBOutlet weak var imageBank: UIImageView!
    @IBOutlet weak var avlBalance: UILabel!
    @IBOutlet weak var lblDefault: UILabel!
    @IBOutlet weak var lblAccountBalance: UILabel!
    @IBOutlet weak var backgroundViewCell: UIView!

     override func awakeFromNib() {
              super.awakeFromNib()
              // Initialization code
           backgroundViewCell.roundCorners(corners: [.bottomLeft, .bottomRight, .topLeft, .topRight], radius: 10.0)
              //  backgroundViewCell.layer.cornerRadius = 10
                backgroundViewCell.layer.masksToBounds = true
          }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(_ balalnce: String){
        lblAccountBalance.text = balalnce
    }
}

class BankAccountSummeryCell: UITableViewCell {
    
    @IBOutlet weak var lblbankName: UILabel!
    @IBOutlet weak var lblimageBank: UIImageView!
    @IBOutlet weak var lblbankAccountName: UILabel!
    @IBOutlet weak var lblaccountNo: UILabel!
    @IBOutlet weak var  lblRoutingNo: UILabel!
    @IBOutlet weak var backgroundViewCell: UIView!

    
    override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
        backgroundViewCell.roundCorners(corners: [.bottomLeft, .bottomRight, .topLeft, .topRight], radius: 20.0)
           //  backgroundViewCell.layer.cornerRadius = 10
             backgroundViewCell.layer.masksToBounds = true
       }
       
    
    func configureCell(_ model: BankAccountModel){
        lblimageBank.setImageForName(model.name, backgroundColor: UIColor.systemPink, circular: true, textAttributes: nil, gradient: true)
        lblbankName.text = model.name
        lblbankAccountName.text = model.accountType
        lblaccountNo.text = model.accountNo
        lblRoutingNo.text = model.routingNo

    }
    
}
class BankAccountSummeryFooterCell: UITableViewCell {
    
    var plusButtonClicked = {}
    @IBOutlet weak var backgroundViewCell: UIView!

    override func awakeFromNib() {
             super.awakeFromNib()
             // Initialization code
        self.backgroundViewCell?.roundCorners(corners: [.bottomLeft, .bottomRight, .topLeft, .topRight], radius: 20.0)
        self.backgroundViewCell?.layer.masksToBounds = true
  
         }
    
    @IBAction func buttonClicked(){
        plusButtonClicked()
    }
}
