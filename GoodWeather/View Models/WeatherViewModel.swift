//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by Wanhar on 13/04/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    
    private var weatherService : WeatherService!
    
    @Published var weather = Weather()
    var cityName: String = ""
    
    
    init() {
        self.weatherService = WeatherService()
    }
    
    func search() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            fetchWeather(city: city)
        }
    }
    
    private func fetchWeather(city : String){
        self.weatherService.getWeather(city: city) { weather in
            if let weather = weather {
                DispatchQueue.main.async {
                   self.weather = weather
                }
            }
        }
    }
    
    var temperatur: String {
        if let temp = self.weather.temp {
            return "\(String(format: "%.0f", temp - 273.15))°C"
        }else{
            return ""
        }
    }
    
    var humidity: String {
        if let humidity = self.weather.humidity {
            return String(format: "%.0f", humidity)
        }else {
            return ""
        }
    }
}
