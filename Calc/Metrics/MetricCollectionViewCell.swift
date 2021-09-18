//
//  MetricCollectionViewCell.swift
//  Calc
//
//  Created by Andrey Boyko on 31.07.2021.
//

import Foundation
import UIKit

class MetricCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleMetric: UILabel!
    @IBOutlet weak var metricView: UIImageView!
    
    func configure(with title: String, image: UIImage?) {
        titleMetric.text = title
        metricView.image = image
    }
}
