//  WeatherResponse.swift
//  Weather Forecast APP
//  Created by Leonardo Oliveira on 17/02/24.

import Foundation

struct ResponseBody: Decodable {
    let timezone: String
    let current: Forecast
    let hourly: [Forecast]
    let daily: [DailyForecast]
}

struct Forecast: Decodable {
    let dt: Int
    let temp: Double
    let humidity: Int
    let windSpeed: Double
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case dt, temp, humidity
        case windSpeed = "wind_speed"
        case weather
    }
}

struct Weather: Decodable {
    let id: Int
    let main, description, icon: String
}

struct DailyForecast: Decodable {
    let dt: Int
    let temp: Temp
    let weather: [Weather]
}

struct Temp: Decodable {
    let min, max: Double
}

