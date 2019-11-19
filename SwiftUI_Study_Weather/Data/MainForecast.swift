//
//  MainForecast.swift
//  SwiftUI_Study_Weather
//
//  Created by 관리자 on 2019/11/19.
//  Copyright © 2019 관리자. All rights reserved.
//

import Foundation
import SwiftUI

struct ForecastWeatherResponse: Decodable {
    var city: City?
    var cod: String?
    var message: Double?
    var cnt: Int?
    var list: [MainForecastParams]?
}

struct MainForecastParams: Decodable {
    var dt: Int?
    var temp: Temp?
    var pressure: Double?
    var humidity: Int?
    var weather: [Weather]?
    var speed: Double?
    var deg: Int?
    var clouds: Int?
}


struct Temp: Decodable {
    var day: Double?
    var min: Double?
    var max: Double?
    var night: Double?
    var eve: Double?
    var morn: Double?
}

struct City: Decodable {
    var id: Int?
    var name: String?
    var coord: Coord?
    var country: String?
    var population: Int?
    var timezone: Int?
}

struct Coord: Decodable {
    var lon: Double?
    var lat: Double?
}

struct Weather: Decodable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}
