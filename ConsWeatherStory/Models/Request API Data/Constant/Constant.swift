//
//  Constant.swift
//  ConsWeatherStory
//
//  Created by Nicholas on 27/10/21.
//

import Foundation
import CoreLocation

class Constant: NSObject {
    static let GET_LEARNING_LIST = "https://api.airtable.com/v0/apprVabLePWWql03P/Learning%20Block?"
    static let POST_LEARNING = "https://api.airtable.com/v0/apprVabLePWWql03P/Learning%20Block"
    
    static func GET_WEATHER_CITY(
        name: String,
        apiKey: String
    ) -> String {
        if NSLocale.autoupdatingCurrent.identifier.hasSuffix("US") {
            return "https://api.openweathermap.org/data/2.5/weather?q=\(name)&units=imperial&appid=\(apiKey)"
        } else {
            return "https://api.openweathermap.org/data/2.5/weather?q=\(name)&units=metric&appid=\(apiKey)"
        }
    }
    
    static func GET_WEATHER_GEO(
        coordinate: CLLocationCoordinate2D,
        apiKey: String
    ) -> String {
        if NSLocale.autoupdatingCurrent.identifier.hasSuffix("US") {
            return "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&units=imperial&appid=\(apiKey)"
        } else {
            return "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&units=metric&appid=\(apiKey)"
        }
    }
}
