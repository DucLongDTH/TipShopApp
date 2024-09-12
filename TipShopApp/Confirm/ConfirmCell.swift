//
//  ConfirmCell.swift
//  TipShopApp
//
//  Created by Long, Nguyen Duc on 12/9/24.
//

import UIKit

protocol ConfirmCellDelegate: AnyObject {
    func didAdd(indexPath: IndexPath)
    func didMinus(indexPath: IndexPath)
}


class ConfirmCell: UITableViewCell {
    var indexPath: IndexPath?
    
    weak var delegate:ConfirmCellDelegate?

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        minusButton.layer.cornerRadius = minusButton.frame.height / 2
        plusButton.layer.cornerRadius = plusButton.frame.height / 2
        img.layer.cornerRadius = 12
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(item: MenuItem, indexPath: IndexPath){
        nameLabel.text = item.name
        priceLabel.text = "$\(item.price)"
        img.image = UIImage(named: item.img)
        countLabel.text = "\(item.count)"
        self.indexPath = indexPath
    }
    
    @IBAction func didTapMinusButtpn() {
        guard let indexPath else { return }
        delegate?.didMinus(indexPath: indexPath)
    }
    
    @IBAction func didTapPlusButton() {
        guard let indexPath else { return }
        delegate?.didAdd(indexPath: indexPath)
    }
}
