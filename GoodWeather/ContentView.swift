//
//  ContentView.swift
//  GoodWeather
//
//  Created by Wanhar on 13/04/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    init() {
        self.weatherViewModel = WeatherViewModel()
    }
    
    var body: some View {
        
        VStack {
            
            TextField("Enter city name",text: self.$weatherViewModel.cityName){
                self.weatherViewModel.search()
            }.font(.custom("Arial", size: 50))
                .padding()
                .fixedSize()
            
            Text(self.weatherViewModel.temperatur)
                .font(.custom("Arial", size: 100))
                .foregroundColor(Color.white)
                .offset(y:100)
                .padding()
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity,alignment: .center)
            .background(Color.green)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


