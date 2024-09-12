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

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate  = self
    }
    
    init(coder: NSCoder, items: [MenuItem], tipAmount: TipOptions) {
        self.items = items
        self.tipAmount = tipAmount
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ReceiptVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count + 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
