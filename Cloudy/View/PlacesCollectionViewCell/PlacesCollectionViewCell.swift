//
//  PlacesCollectionViewCell.swift
//  Cloudy
//
//  Created by Serhii Kovtunenko on 14.06.2020.
//  Copyright © 2020 Serhii Kovtunenko. All rights reserved.
//

import UIKit

class PlacesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var dateKeyLabel: UILabel!
    @IBOutlet weak var dateValueLabel: UILabel!
    @IBOutlet weak var windKeyLabel: UILabel!
    @IBOutlet weak var windValueLabel: UILabel!
    @IBOutlet weak var cloudsKeyLabel: UILabel!
    @IBOutlet weak var cloudsValueLabel: UILabel!
    @IBOutlet weak var pressureKeyLabel: UILabel!
    @IBOutlet weak var pressureValueLabel: UILabel!
    @IBOutlet weak var humidityKeyLabel: UILabel!
    @IBOutlet weak var humidityValueLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
