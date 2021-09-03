//
//  CurrencyTableViewController.swift
//  Calc
//
//  Created by Andrey Boyko on 12.07.2021.
//

import Foundation
import UIKit

protocol CurrencyTableViewControllerDelegate: class {
    func currencySelected(currency: String)
    //....
}

class CurrencyTableViewController: UITableViewController {
    
    weak var delegate: CurrencyTableViewControllerDelegate?
    let isoCurrencyCodes = NSLocale.isoCurrencyCodes
    
    let reuseIdentifier = "reuseIdentifier"
    
    //MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    //MARK: - TableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isoCurrencyCodes.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else { return UITableViewCell() }
//        indexPath.row
//        indexPath.section
//        indexPath.item
//        cell.textLabel?.text = String(indexPath.row)
        cell.textLabel?.text = isoCurrencyCodes[indexPath.row]
        return cell
    }
    
    
    //MARK: - TableViewDelegate
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.currencySelected(currency: isoCurrencyCodes[indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
