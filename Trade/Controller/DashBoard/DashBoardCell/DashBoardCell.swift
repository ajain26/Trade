//
//  DashBoardCell.swift
//  Trade
//
//  Created by Anshul on 10/01/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit

class DashBoardCell: UITableViewCell {
 
    @IBOutlet weak var accountImage: UIImageView!
    @IBOutlet weak var backgroundViewCell: UIView!

    @IBOutlet weak var pointTitle: UILabel!
    @IBOutlet weak var titleAccount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundViewCell.roundCorners(corners: [.bottomLeft, .bottomRight, .topLeft, .topRight], radius: 10.0)
      //  backgroundViewCell.layer.cornerRadius = 10
        backgroundViewCell.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
