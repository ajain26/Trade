//
//  SensexPriceCell.swift
//  Trade
//
//  Created by Anshul on 30/01/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit

class SensexPriceCell: UITableViewCell {
    
    @IBOutlet weak var lblProduct: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var lbldecrementPoint: UILabel!
    @IBOutlet weak var lbldecrementPrice: UILabel!
    @IBOutlet weak var lbllastmonth: UILabel!
    @IBOutlet weak var lblthreemonth: UILabel!
    @IBOutlet weak var lblqtd: UILabel!
    @IBOutlet weak var lblytd: UILabel!



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(model: SensexPrice){
           lblProduct.text = model.title
           lblprice.text  = model.price
           lbldecrementPoint.text = model.decrementPoint
           lbldecrementPrice.text = model.decrementPrice
           lbllastmonth.text = model.lastmonth
           lblthreemonth.text = model.threemonth
           lblqtd.text = model.qtd
           lblytd.text = model.ytd
       }

}
