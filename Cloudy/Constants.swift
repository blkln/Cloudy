//
//  Constants.swift
//  Cloudy
//
//  Created by Serhii Kovtunenko on 14.06.2020.
//  Copyright © 2020 Serhii Kovtunenko. All rights reserved.
//

import Foundation

struct Constants {
    
    enum Storyboard: String {
        case main = "Main"
    }
    
    enum StoryboardIDs: String {
        case placesVC = "PlacesViewController"
        case forecastVC = "ForecastViewController"
    }
    
    //MARK: - Networking
    static let APIKey = "f05519111df4ee763f1c0e3cf501f728"
    
    enum ContentType: String {
        case multipart = "multipart/form-data"
        case urlencoded = "application/x-www-form-urlencoded"
        case app_json = "application/json"
    }

}
