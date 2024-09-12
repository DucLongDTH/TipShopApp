//
//  TipVC.swift
//  TipShopApp
//
//  Created by Long, Nguyen Duc on 10/9/24.
//

import UIKit

class TipVC: UIViewController {
    lazy var barButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            title: "Submit",
            style: .done,
            target: self,
            action: #selector(didTapbarButton))
        return button
    }()
    
    lazy var tipSelection: [UIButton] = [
        smallTip,
        mediumTip,
        largeTip,
        skipButton
    ]
    
    var items: [MenuItem]
    var tipAmount: TipOptions = .small
    
    @IBOutlet weak var stackview: UIStackView!
    @IBOutlet weak var smallTip: UIButton!
    @IBOutlet weak var mediumTip: UIButton!
    @IBOutlet weak var largeTip: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    init(coder: NSCoder, items: [MenuItem]) {
        self.items = items
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tip"
        navigationItem.rightBarButtonItem = barButton
        skipButton.layer.cornerRadius = 12
        stackview.arrangedSubviews.forEach { button in
            button.layer.cornerRadius = 20
        }
        smallTip.isSelected = true
       
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let orientation = UIDevice.current.orientation
        if orientation.isPortrait {
            stackview.axis = .vertical
        } else if orientation == .landscapeLeft || orientation == .landscapeRight {
            stackview.axis = .horizontal
        }
    }
    
    @objc func didTapbarButton() {
        let sb = UIStoryboard(name: "ReceiptVC", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "ReceiptVC", creator: {[unowned self] coder in
            let receiptVC = ReceiptVC(coder: coder, items: items, tipAmount: tipAmount)
            return receiptVC
        })
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didSelectSmallTip(_ sender: Any) {
        deSelection()
        smallTip.isSelected = true
        tipAmount = .small
    }
    
    @IBAction func didSelectMediumTip(_ sender: Any) {
        deSelection()
        mediumTip.isSelected = true
        tipAmount = .medium
    }
    
    @IBAction func didSelectLargeTip(_ sender: Any) {
        deSelection()
        largeTip.isSelected = true
        tipAmount = .large
    }
    @IBAction func didSelectTip(_ sender: Any) {
        deSelection()
        skipButton.isSelected = true
        tipAmount = .none
    }
    
    func deSelection() {
        tipSelection.forEach { button in
            button.isSelected = false
        }
    }
}
