//
//  MetricCollectionViewController.swift
//  Calc
//
//  Created by Andrey Boyko on 31.07.2021.
//

import Foundation
import UIKit





class MetricCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellCollectionReuseIdentifier =  "cellCollectionReuseIdentifier"
    let metrics = ["Mass", "Lenght", "Temperature"]
    var dataDict: [String: UIImage] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: "MetricCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellCollectionReuseIdentifier)
        createDataDict()
    }
    
    
    func createDataDict() {
        for metric in metrics {
            switch metric {
            case "Mass":
                dataDict[metric] = UIImage(named: "imageGiri")
            case "Lenght":
                dataDict[metric] = UIImage(systemName: "ruler.fill")
            case "Temperature":
                dataDict[metric] = UIImage(systemName: "thermometer")
            default:
                break
            }
        }
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        metrics.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellCollectionReuseIdentifier, for: indexPath) as? MetricCollectionViewCell else {
            return UICollectionViewCell()
        }
        let title = metrics[indexPath.item]
        cell.configure(with: title, image: dataDict[title])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "MetricCalculationViewController") as? MetricCalculationViewController else { return }
        vc.title = metrics[indexPath.item]
        vc.calculationType = CalculationType(rawValue: metrics[indexPath.item])
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = (collectionView.frame.width) / 2
        let width = height
        return CGSize(width: width, height: height)
    }
}

