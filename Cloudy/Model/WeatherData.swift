//
//  WeatherData.swift
//  Cloudy
//
//  Created by Serhii Kovtunenko on 15.06.2020.
//  Copyright © 2020 Serhii Kovtunenko. All rights reserved.
//

import Foundation

// MARK: - ForecastWeatherData
struct ForecastWeatherData: Codable {
    let cod: String
    let message, cnt: Int
    let weatherData: [WeatherData]
    let city: City
    
    enum CodingKeys: String, CodingKey {
        case cod, message, cnt, city
        case weatherData = "list"
    }
}

extension ForecastWeatherData {
    init?(jsonData: Data) {
        guard let weatherData = try? JSONDecoder().decode(ForecastWeatherData.self, from: jsonData) else {
            return nil
        }
        self = weatherData
    }
}

// MARK: - CurrentWeatherData
struct CurrentWeatherData: Codable {
    let name: String
    let coord: Coord
    let timezone, cityId: Int
    let cod: Int
    let base: String
    let visibility: Int

//    let weatherData: WeatherData
    
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let rain: Rain
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    
    enum CodingKeys: String, CodingKey {
        case name, coord, timezone, cod, base, visibility
        case dt, main, weather, clouds, wind, rain, sys
        case cityId = "id"
    }
    
}

extension CurrentWeatherData {
    init?(jsonData: Data) {
        guard let weatherData = try? JSONDecoder().decode(CurrentWeatherData.self, from: jsonData) else {
            return nil
        }
        self = weatherData
    }
}

// MARK: City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: Coord
struct Coord: Codable {
    let lat, lon: Double
}

// MARK: WeatherData
struct WeatherData: Codable {
    let dt: Int
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let rain: Rain?
    let sys: Sys
    let dtTxt: String?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, rain, sys
        case dtTxt = "dt_txt"
    }
}

// MARK: Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int
    let seaLevel, grndLevel: Int?
    let tempKf: Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: Rain
struct Rain: Codable {
    let the1H, the3H: Double?

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
        case the3H = "3h"
    }
}

// MARK: Sys
struct Sys: Codable {
    let type, id: Int?
    let country, pod: String?
    let sunrise, sunset: Int?

}

// MARK: Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}

