//
//  ReceiptVC.swift
//  TipShopApp
//
//  Created by Long, Nguyen Duc on 10/9/24.
//

import UIKit

class ReceiptVC: UIViewController {
    
    var items: [MenuItem]
    var tipAmount: TipOptions = .small
    var total: Double = 0.0

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate  = self
    }
    
    init(coder: NSCoder, items: [MenuItem], tipAmount: TipOptions) {
        self.items = items
        self.tipAmount = tipAmount
        self.total = items.calculateTotal(with: tipAmount)
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ReceiptVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        if row < items.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptItemRowCell", for: indexPath) as! ReceiptItemRowCell
            cell.configure(item: items[indexPath.row])
            return cell
        } else if row == items.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptTipRowCell", for: indexPath) as! ReceiptTipRowCell
            cell.configure(tip: tipAmount)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptTotalRowCell", for: indexPath) as! ReceiptTotalRowCell
            cell.configure(total: total)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count + 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
