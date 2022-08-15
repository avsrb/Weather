//
//  WeatherData.swift
//  Weather
//
//  Created by Artem Serebriakov on 15.08.2022.
//

import Foundation

//A type that can decode itself from an external representation.
struct WeatherData: Decodable {
    let info: Info
    let fact: Fact
    let forecast: [Forecast]
}

struct Info: Decodable {
    let url: String
    let fact: Fact
}

struct Fact: Decodable {
    let temp: Int
    let icon: String
    let condition: String
    let windSpeed: Int
    let pressureMm: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case icon
        case condition
        case windSpeed = "wind_speed"
        case pressureMm = "pressure_mm"

    }
}

struct Forecast: Decodable {
    let parts: Parts
}

struct Parts: Decodable {
    let day: Day
}

struct Day: Decodable {
    let tempMin:Int?
    let tempMax:Int?
    
    enum CodingKeys: String, CodingKey {
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

