//
//  MetricCalculationTableViewController.swift
//  Calc
//
//  Created by Andrey Boyko on 04.08.2021.
//

import Foundation
import UIKit

protocol MetricCalculationTableViewControllerDelegate: class {
    func metricCalculation(metric: String)
    //.....
}

class MetricCalculationTableViewController: UITableViewController {
    
    var delegate: MetricCalculationTableViewControllerDelegate?
    var metrics: [String] = []
   
    let cellId = "cellId"
    
    //MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        metrics = Lenght.allCases.map({ $0.rawValue })
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        print("cells - \(metrics)")
    }
    //MARK: - TableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return metrics.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId) else { return UITableViewCell() }
//        indexPath.row
//        indexPath.section
//        indexPath.item
//        cell.textLabel?.text = String(indexPath.row)
        cell.textLabel?.text = metrics[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.metricCalculation(metric: metrics[indexPath.row])
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
