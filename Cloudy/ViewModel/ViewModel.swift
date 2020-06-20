//
//  ViewModel.swift
//  Cloudy
//
//  Created by Serhii Kovtunenko on 15.06.2020.
//  Copyright © 2020 Serhii Kovtunenko. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel {
    let currentWeather: PublishSubject<[CurrentWeatherData]> = PublishSubject()
    let forecastWeather: PublishSubject<[ForecastWeatherData]> = PublishSubject()
    let error : PublishSubject<CError> = PublishSubject()
    enum CError {
        case internetError(String)
        case serverMessage(String)
    }
    private let disposable = DisposeBag()
    
    let places = ["kyiv", "odesa", "lviv"]
    var cityWeather: [CurrentWeatherData]? {
        didSet {
            self.currentWeather.onNext(cityWeather!)
        }
    }
    
    func getWeather() {
        for city in places {
            Network.getCurrentWeather(in: city, success: { (weatherData) in
                if self.cityWeather == nil {
                    self.cityWeather = [weatherData]
                } else {
                   self.cityWeather!.append(weatherData)
                }
            }) { (error) in
                switch error {
                case .connectionError:
                    self.error.onNext(.internetError(Constants.APIError.connectionError.rawValue))
                case .authorizationError(let errorJson):
                    self.error.onNext(.serverMessage(errorJson["message"] ?? Constants.APIError.authorizationError.rawValue))
                default:
                    self.error.onNext(.serverMessage(Constants.APIError.unknownError.rawValue))
                }
            }
        }
    }
}
