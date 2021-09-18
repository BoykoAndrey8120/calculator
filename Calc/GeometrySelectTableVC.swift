//
//  GeometrySelectTableVC.swift
//  Calc
//
//  Created by Andrey Boyko on 14.08.2021.
//

import Foundation
import UIKit

protocol GeometryCalculationTableViewControllerDelegate: class {
    func geometryCalculation(figure: Figure)
}

class GeometrySelectTableVC: UITableViewController {
    
    var delegate: GeometryCalculationTableViewControllerDelegate?
    var geometry: [Figure] = []
    let geometryCellId = "geometryCellId"
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: geometryCellId)
        print("cells - \(geometry)")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return geometry.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: geometryCellId) else { return UITableViewCell() }
        cell.textLabel?.text = geometry[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.geometryCalculation(figure: geometry[indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
    }
}
