//
//  ConfirmVC.swift
//  TipShopApp
//
//  Created by Long, Nguyen Duc on 10/9/24.
//

import UIKit

class ConfirmVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items: [MenuItem]
    
    lazy var barButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            title: "Submit",
            style: .done,
            target: self,
            action: #selector(didTapbarButton))
        return button
    }()
    
    init(coder: NSCoder, items: [MenuItem]) {
        self.items = items
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Confirm"
        setupTableView()
        navigationItem.rightBarButtonItem = barButton
    }
    
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ConfirmCell", bundle: nil), forCellReuseIdentifier: "ConfirmCell")
    }
    
    @objc func didTapbarButton() {
        let sb = UIStoryboard(name: "TipVC", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "TipVC", creator: {[unowned self] coder in
            let tipVC = TipVC(coder: coder, items: items)
            return tipVC
        })
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ConfirmVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmCell", for: indexPath) as! ConfirmCell
        
        let index = indexPath.row
        cell.configure(item: items[index], indexPath: indexPath)
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}

extension ConfirmVC: ConfirmCellDelegate {
    func didAdd(indexPath: IndexPath) {
        items[indexPath.row].count += 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func didMinus(indexPath: IndexPath) {
        items[indexPath.row].count -= 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    
}
