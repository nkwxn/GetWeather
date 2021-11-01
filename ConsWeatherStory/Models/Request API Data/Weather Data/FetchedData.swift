//
//  FetchedData.swift
//  ConsWeatherStory
//
//  Created by Nicholas on 27/10/21.
//

import Foundation

struct FetchedData: Codable {
    let name: String // the city name
    let weather: [WeatherIcon]
    let main: WeatherData
}

struct WeatherIcon: Codable {
    let id: Int
    let main: String
    let description: String
}

struct WeatherData: Codable {
    let temp: Double
    let pressure: Double // in hPa
    let humidity: Double // in %
}
