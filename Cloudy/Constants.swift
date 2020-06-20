//
//  Constants.swift
//  Cloudy
//
//  Created by Serhii Kovtunenko on 14.06.2020.
//  Copyright © 2020 Serhii Kovtunenko. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    struct Colors {
        static let Orange = UIColor(red: 222, green: 128, blue: 99, alpha: 1.0)
        static let Gray = UIColor(red: 90, green: 90, blue: 90, alpha: 1.0)
    }

    enum Storyboard: String {
        case main = "Main"
    }
    
    enum StoryboardIDs: String {
        case placesVC = "PlacesViewController"
        case forecastVC = "ForecastViewController"
    }
    
    //MARK: - Networking
    static let APIKey = "f05519111df4ee763f1c0e3cf501f728"
    static let urlScheme = "https"
    static let urlHost = "api.openweathermap.org"
    //  Query parameters
    static let appID = "appid"
    static let query = "q"
    static let units = "units"
    
    enum Path: String {
        case current = "/data/2.5/weather"
        case forecast = "/data/2.5/forecast"
    }
    
    enum ContentType: String {
        case multipart = "multipart/form-data"
        case urlencoded = "application/x-www-form-urlencoded"
        case app_json = "application/json"
    }

    enum APIError: String {
        case connectionError = "Check your Internet connection"
        case authorizationError = "Authorization Error"
        case unknownError = "Unknown Error"
    }
}

enum Units: String {
    case metric = "metric"
    case imperial = "imperial"
    case percent = "%"
    case celcium = "℃"
    case fahrenheit = "℉"
    case pressure = "hPa"
}
