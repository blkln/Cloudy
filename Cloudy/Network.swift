//
//  Network.swift
//  Cloudy
//
//  Created by Serhii Kovtunenko on 15.06.2020.
//  Copyright © 2020 Serhii Kovtunenko. All rights reserved.
//

import Foundation

class Network {
    
    static let APIBaseUrl = "api.openweathermap.org/data/2.5/"
    
    enum HTTPMethod: String {
        case options = "OPTIONS"
        case get     = "GET"
        case head    = "HEAD"
        case post    = "POST"
        case put     = "PUT"
        case patch   = "PATCH"
        case delete  = "DELETE"
        case trace   = "TRACE"
        case connect = "CONNECT"
    }
    
    enum RequestError: Error {
        case unknownError
        case connectionError
        case authorizationError([String: String])
        case invalidRequest
        case notFound
        case invalidResponse
        case serverError
        case serverUnavailable
    }
    
    static func getCurrentWeather(in city: String,
                                  success: @escaping (CurrentWeatherData) -> Void,
                                  failure: @escaping (RequestError) -> Void) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = Constants.urlScheme
        urlComponents.host = Constants.urlHost
        urlComponents.path = Constants.Path.current.rawValue
        urlComponents.queryItems = [URLQueryItem(name: Constants.appID, value: Constants.APIKey)]
        urlComponents.queryItems?.append(URLQueryItem(name: Constants.query, value: city))
        urlComponents.queryItems?.append(URLQueryItem(name: Constants.units, value: Units.metric.rawValue))
        guard let url = urlComponents.url else { return }
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 15)
        urlRequest.allHTTPHeaderFields = ["Content-Type": "application/x-www-form-urlencoded"]
        urlRequest.httpMethod = HTTPMethod.get.rawValue

        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print(error)
                failure(.connectionError)
            } else if let responseData = data, let responseCode = response as? HTTPURLResponse {
                do {
                    print("responseCode : \(responseCode.statusCode)")
                    switch responseCode.statusCode {
                    case 200:
                        let result = try JSONDecoder().decode(CurrentWeatherData.self, from: responseData)
                        print("result : \(result)")
                        success(result)
                    case 400...499:
                        let error = try JSONDecoder().decode([String: String].self, from: responseData)
                        failure(.authorizationError(error))
                    case 500...599:
                        failure(.serverError)
                    default:
                        failure(.unknownError)
                        break
                    }
                } catch let parsingError {
                    failure(.unknownError)
                    print("error on parsing request to JSON : \(parsingError)")
                }
            }
        }.resume()
    }

}

extension String
{
    func APIBaseUrl() -> String {
        return Network.APIBaseUrl + self
    }
}

