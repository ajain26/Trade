//
//  CashSumeryCell.swift
//  Trade
//
//  Created by Anshul on 12/01/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit

class CashSumeryCell: UITableViewCell {
    
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var lblAvlBal: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lbldate: UILabel!



    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func updateCell(model: CashSummery){
        lblValue.text = model.value
        lblAvlBal.text = model.avlBal
        lblStatus.text = model.status
        lbldate.text = model.date
        
    }

}
