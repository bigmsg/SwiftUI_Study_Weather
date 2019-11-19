//
//  Service.swift
//  SwiftUI_Study_Weather
//
//  Created by 관리자 on 2019/11/19.
//  Copyright © 2019 관리자. All rights reserved.
//

import Foundation

// MARK: - TopLevel
struct TopLevel: Codable {
    let city: City
    let cod: String
    let message: Double
    let cnt: Int
    let list: [List]
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - List
struct List: Codable {
    let dt: Int
    let temp: Temp
    let pressure: Double
    let humidity: Int
    let weather: [Weather]
    let speed: Double
    let deg, clouds: Int
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}


class WeatherService {
    
    fileprivate let openWeatherAPIKey = "ed60fcfbd110ee65c7150605ea8aceea"
    
    
    lazy var baseUrl: URL = {
         return URL(string: "https://api.openweathermap.org/data/2.5/forecast/daily")! //unwrapping what could be "nothing"
    }()
    
    private let session: URLSession
    private let decoder: JSONDecoder
    
    
    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        
        self.session = session
        self.decoder = decoder
    }
    
    func search(matching query: String, handler: @escaping (Result<TopLevel, Error>) -> Void) {
       
        guard var urlComponents = URLComponents(string: "\(baseUrl)") else {
                preconditionFailure("Can't create url...")
            
        }
        
        //api.getdata..?beira
         urlComponents.queryItems = [
              URLQueryItem(name: "q", value: query),
              URLQueryItem(name: "appid", value: openWeatherAPIKey),
              URLQueryItem(name: "units", value: "imperial") //"metric = celsius
              
        
         ]
        
        guard let url = urlComponents.url else {preconditionFailure("Can't create url from url components...")}
        
        session.dataTask(with: url) {
            [weak self] data, _, error in
            if let error = error {
                 handler(.failure(error))
            }else {
                do {
                    let data = data ?? Data()
                    let response = try
                         self?.decoder.decode(TopLevel.self, from: data)
                    handler(.success(response!))
                    
                } catch {
                     handler(.failure(error))
                }
            }
        }.resume()
        
        
        
        
    }
    
}
