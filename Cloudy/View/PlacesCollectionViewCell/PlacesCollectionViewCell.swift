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
    
    @IBOutlet weak var feelsLikeKeyLabel: UILabel!
    @IBOutlet weak var feelsLikeValueLabel: UILabel!
    
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

    var currentWeather: CurrentWeatherData? {
        didSet {
            guard let weather = currentWeather else { return }
            temperatureLabel.text = String(format: "%d %@, %@", Int(weather.main.temp), Units.celcium.rawValue, weather.weather.first?.weatherDescription ?? "")
            feelsLikeValueLabel.text = "\(Int(weather.main.feelsLike)) \(Units.percent.rawValue)"
            let date = Date(timeIntervalSince1970: weather.dt)
            let formatter = DateFormatter()
            formatter.timeZone = TimeZone.current
            formatter.dateFormat = "dd.MM' 'HH:mm"
            formatter.locale = Locale.current
            dateValueLabel.text = formatter.string(from: date)
            windValueLabel.text = "\(weather.wind.speed), \(getWindDirection(by: weather.wind.deg).rawValue)"
            cloudsValueLabel.text = "\(weather.clouds.all) \(Units.percent.rawValue)"
            pressureValueLabel.text = "\(weather.main.pressure) \(Units.pressure.rawValue)"
            humidityValueLabel.text = "\(weather.main.humidity) \(Units.percent.rawValue)"
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func getWindDirection(by degree: Double) -> Constants.WindDirection {
        var windDirection: Constants.WindDirection
        if (degree > 11.25 && degree <= 33.75) {
            windDirection = Constants.WindDirection.NNE //"North-Northeast"
        } else if (degree > 33.75 && degree <= 56.25) {
            windDirection = Constants.WindDirection.NE //"Northeast"
        } else if (degree > 56.25 && degree <= 78.75) {
            windDirection = Constants.WindDirection.ENE //"East-Northeast"
        } else if (degree > 78.75 && degree <= 101.25) {
            windDirection = Constants.WindDirection.E //"East"
        } else if (degree > 101.25 && degree <= 123.75) {
            windDirection = Constants.WindDirection.ESE //"East-Southeast"
        } else if (degree > 123.75 && degree <= 146.25) {
            windDirection = Constants.WindDirection.SE //"Southeast"
        } else if (degree > 146.25 && degree <= 168.75) {
            windDirection = Constants.WindDirection.SSE //"South-Southeast"
        } else if (degree > 168.75 && degree <= 191.25) {
            windDirection = Constants.WindDirection.S //"South"
        } else if (degree > 191.25 && degree <= 213.75) {
            windDirection = Constants.WindDirection.SSW //"South-Southwest"
        } else if (degree > 213.75 && degree <= 236.25) {
            windDirection = Constants.WindDirection.SW //"Southwest"
        } else if (degree > 236.25 && degree <= 258.75) {
            windDirection = Constants.WindDirection.WSW //"West-Southwest"
        } else if (degree > 258.75 && degree <= 281.25) {
            windDirection = Constants.WindDirection.W //"West"
        } else if (degree > 281.25 && degree <= 303.75) {
            windDirection = Constants.WindDirection.WNW //"West-Northwest"
        } else if (degree > 303.75 && degree <= 326.25) {
            windDirection = Constants.WindDirection.NW //"Northwest"
        } else if (degree > 326.25 && degree <= 348.75) {
            windDirection = Constants.WindDirection.NNW //"North-Northwest"
        } else {
            windDirection = Constants.WindDirection.N //"North"
        }
        return windDirection
    }

}
