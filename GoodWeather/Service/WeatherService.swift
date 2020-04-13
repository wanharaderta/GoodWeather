//
//  WeatherService.swift
//  GoodWeather
//
//  Created by Wanhar on 13/04/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import Foundation


class WeatherService {
    
    func getWeather(city:String, completion: @escaping (Weather?) -> ()){
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=3302b5c2446c41e0fe0dd2268069674f") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if weatherResponse != nil{
                let weather =   weatherResponse?.main
                completion(weather)
            }else{
                completion(nil)
            }
        }.resume()
        
        
    }
}
