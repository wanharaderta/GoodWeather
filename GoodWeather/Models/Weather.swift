//
//  Weather.swift
//  GoodWeather
//
//  Created by Wanhar on 13/04/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import Foundation

struct WeatherResponse : Decodable {
    
    let main : Weather
}

struct Weather : Decodable {
    
//    "temp": 300.16,
//    "feels_like": 305.37,
//    "temp_min": 299.15,
//    "temp_max": 301.15,
//    "pressure": 1010,
//    "humidity": 94

    var temps: Double?
    var humidity:Double?
    
}
