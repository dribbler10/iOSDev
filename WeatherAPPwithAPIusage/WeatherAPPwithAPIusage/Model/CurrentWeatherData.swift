//
//  CurrentWeatherData.swift
//  WeatherAPPwithAPIusage
//
//  Created by Asyl Yerzhanuly on 13.08.2022.
//

import Foundation

struct CurrentWeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
    }
}

struct Weather: Codable {
    let id: Int
}

