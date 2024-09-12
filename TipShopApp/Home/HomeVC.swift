//
//  HomeVC.swift
//  TipShopApp
//
//  Created by Long, Nguyen Duc on 10/9/24.
//

import UIKit

class HomeVC: UIViewController {
    var data: [MenuItem] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupTableView()
        
    }
    
    func fetchData(){
        data = API.shared.fetchData()
    }
    
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func didTapCartButton(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "ConfirmVC", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "ConfirmVC", creator: { coder in
            let confirmVC = ConfirmVC(coder: coder, items: self.getMenuItem())
            return confirmVC
        })
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func getMenuItem() -> [MenuItem] {
        var items: [MenuItem] = []
        for item in data {
            if item.count > 0 {
                items.append(item)
            }
        }
        return items
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableCell", for: indexPath) as! HomeTableCell
        
        let index = indexPath.row
        cell.configure(item: data[index], indexPath: indexPath)
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.row].count += 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}

extension HomeVC: HomeTableCellDelegate {
    func didAdd(indexPath: IndexPath) {
        data[indexPath.row].count += 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func didMinus(indexPath: IndexPath) {
        data[indexPath.row].count -= 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    
}

