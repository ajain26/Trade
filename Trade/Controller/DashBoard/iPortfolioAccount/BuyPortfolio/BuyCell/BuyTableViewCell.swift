//
//  BuyTableViewCell.swift
//  Trade
//
//  Created by Anshul on 03/02/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit

class BuyTableViewCell: UITableViewCell {
    @IBOutlet weak var lblCoampny: UILabel!
    @IBOutlet weak var lblStocks: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblReturn: UILabel!

    


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(model: BuyModel){
        lblCoampny.text = model.company
        lblAmount.text = model.amount
        lblStocks.text = model.stocks
        lblReturn.text = model.stockreturns
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
