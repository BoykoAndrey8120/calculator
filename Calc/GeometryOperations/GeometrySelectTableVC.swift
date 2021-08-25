//
//  GeometrySelectTableVC.swift
//  Calc
//
//  Created by Andrey Boyko on 12.08.2021.
//
import Foundation
import UIKit

protocol GeometrySelectTableVCDelegate?: class {
    func geometrySelect(geometry: String)
    //.....
}

class GeometrySelectTableVC: UITableViewController {
    var delegate: GeometrySelectTableVCDelegate?
    var geometricFigures: [String] = []
    let cellId = "cellId"
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        print("cells - \(geometry)")
        
    }
        // Do any additional setup after loading the view.
    //MARK: - TableViewDataSource
    
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return geometricFigures.count
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
            cell.textLabel?.text = geometricFigures[indexPath.row]
            return cell
        }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            delegate?.geometricFigures(geometry: geometry[indexPath.row])
            self.dismiss(animated: true, completion: nil)
            
}
