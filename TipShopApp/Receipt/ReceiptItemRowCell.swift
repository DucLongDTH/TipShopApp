//
//  ReceiptItemRowCell.swift
//  TipShopApp
//
//  Created by Long, Nguyen Duc on 12/9/24.
//

import UIKit

class ReceiptItemRowCell: UITableViewCell {

    @IBOutlet var countLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(item: MenuItem){
        countLabel.text = "\(item.count)"
        nameLabel.text = item.name
        priceLabel.text = "\(Double(item.count) * item.price)"
        
    }
}
