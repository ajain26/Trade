//
//  StockActivityListCell.swift
//  Trade
//
//  Created by Anshul on 01/02/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit

class StockActivityListCell: UITableViewCell {
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet  weak var lblMaturityType: UILabel!
    @IBOutlet weak var lblDeduction: UILabel!
    @IBOutlet weak var lblDepositType: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(model: StockActivtyModel){
        lblDate.text = model.date
        lblMaturityType.text = model.maturityType
        lblDeduction.text = model.deduction
        lblDepositType.text = model.depositType
    }

}
