//
//  GeometryCalculationViewController.swift
//  Calc
//
//  Created by Andrey Boyko on 09.08.2021.
//
import Foundation
import UIKit

class GeometryCalculationViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var figureView: UIImageView!
    @IBOutlet weak var figureLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapdLabel(_ sender: UITapGestureRecognizer) {
        guard let geometryVC = storyboard?.instantiateViewController(withIdentifier: "GeometrySelectTableVC") as? GeometrySelectTableVC else {
            return
        }
        print("tap")
    }
    @IBAction func tapCalculate(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    extension GeometryCalculationViewController: GeometrySelectTableVCDelegate {
        func geometrySelect(geometry: String) {
            print(geometry)
        }
}
}
