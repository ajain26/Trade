//
//  SegmentCell.swift
//  Trade
//
//  Created by Anshul on 16/01/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit

class SegmentCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(model: CashSummeryModel ){
        label.text = model.name
        if model.isSelected{
            imageView.backgroundColor = UIColor.white
        }else{
            imageView.backgroundColor = UIColor.clear
        }
    }
    
}
