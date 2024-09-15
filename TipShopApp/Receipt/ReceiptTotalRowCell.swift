//
//  ReceiptTotalRowCell.swift
//  TipShopApp
//
//  Created by Long, Nguyen Duc on 12/9/24.
//

import UIKit

class ReceiptTotalRowCell: UITableViewCell {

    @IBOutlet var totalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(total: Double) {
        totalLabel.text = "\(total)"
    }

}
