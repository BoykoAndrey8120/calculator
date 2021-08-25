//
//  GeometryCalculationViewController.swift
//  Calc
//
//  Created by Andrey Boyko on 13.08.2021.
//
import Foundation
import UIKit


class GeometryCalculationViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var imageFigure: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var figureLabel: UILabel!
    @IBOutlet weak var textFieldPicker: UITextField!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
        var topConstraintConstant: CGFloat?
    var pikerView = UIPickerView()
    var data = GeometryDataGenerator.shared.createData()
    var selectedFigure: Figure? {
        didSet {
            updateData()
        }
    }
    var selectedFormula: Formula? {
        didSet {
            updateFields()
            textFieldPicker.text = selectedFormula?.name
        }
    }
    
    var fields: [GeometryOperationRowView] = []
    var pickerRow: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topConstraintConstant = topConstraint.constant
        resultLabel.text = ""
        label.text = ""
        selectedFigure = data.first
        pikerView.delegate = self
        pikerView.dataSource = self
        textFieldPicker.inputView = pikerView
        textFieldPicker.textAlignment = .left
        textFieldPicker.placeholder = "Selecte formula"
    }
    
    func updateData() {
        if let imageLabel = selectedFigure?.imageName {
            imageFigure.image = UIImage(systemName: imageLabel)
        }
        selectedFormula = selectedFigure?.formulas.first
        figureLabel.text = selectedFigure?.name
        

    }
    
    func updateFields() {
        fields.forEach { $0.removeFromSuperview() }
        self.fields = []
        
        guard let selectedFormulaFields = selectedFormula?.fields else { return }
        for fieldInfo in selectedFormulaFields {
            guard let rowView = Bundle.main.loadNibNamed("GeometryOperationRowView",
                                                         owner: self,
                                                         options: nil)?.first as? GeometryOperationRowView else {
                continue
            }
            rowView.configure(with: fieldInfo)
            fields.append(rowView)
        }
        fields.forEach { self.stackView.insertArrangedSubview($0, at: 0) }
    }
    
    
    
    @IBAction func tapCalculate(_ sender: Any) {
        resultLabel.text = ""
        label.text = ""
        fields.forEach { $0.prepareData() }
        guard let value = selectedFormula?.calculate() else { return }
        label.text = String(value)
        resultLabel.text = "Result"
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
    }
    @IBAction func tapFigureLabel(_ sender: UITapGestureRecognizer) {
        guard let geometryVC = storyboard?.instantiateViewController(withIdentifier: "GeometrySelectTableVC") as? GeometrySelectTableVC else {
            return
        }
        topConstraint.constant = -300
        geometryVC.delegate = self
        geometryVC.geometry = self.data
        self.tabBarController?.present(geometryVC, animated: true, completion: nil)
    }
}



extension GeometryCalculationViewController: GeometryCalculationTableViewControllerDelegate {
    func geometryCalculation(figure: Figure) {
        selectedFigure = figure
        topConstraint.constant = topConstraintConstant ?? 0 
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}
extension GeometryCalculationViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        selectedFigure?.formulas.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return selectedFigure?.formulas[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedFormula = selectedFigure?.formulas[row]
        textFieldPicker.resignFirstResponder()
    }
}
