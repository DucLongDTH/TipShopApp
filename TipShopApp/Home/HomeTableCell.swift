//
//  HomeTableCell.swift
//  TipShopApp
//
//  Created by Long, Nguyen Duc on 11/9/24.
//

import UIKit

protocol HomeTableCellDelegate: AnyObject {
    func didAdd(indexPath: IndexPath)
    func didMinus(indexPath: IndexPath)
}

class HomeTableCell: UITableViewCell {
    
    weak var delegate:HomeTableCellDelegate?
    var indexPath: IndexPath?
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var stackCountView: UIStackView!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        minusButton.layer.cornerRadius = minusButton.frame.height / 2
        plusButton.layer.cornerRadius = plusButton.frame.height / 2
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
        if item.count > 0 {
            stackCountView.isHidden = false
        } else {
            stackCountView.isHidden = true
        }
    }
    
    @IBAction func didTapMinusButton(_ sender: Any) {
        guard let indexPath else { return }
        delegate?.didMinus(indexPath: indexPath)
    }
    
    @IBAction func didTapPlusButton() {
        guard let indexPath else { return }
        delegate?.didAdd(indexPath: indexPath)
    }
}
