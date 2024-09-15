//
//  ReceiptTipRowCell.swift
//  TipShopApp
//
//  Created by Long, Nguyen Duc on 12/9/24.
//

import UIKit

class ReceiptTipRowCell: UITableViewCell {

    @IBOutlet var tipLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(tip: TipOptions){
        tipLabel.text = tip.toPercentString()
    }

}
