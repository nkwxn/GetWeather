//
//  ContentView.swift
//  ConsWeatherStory
//
//  Created by Nicholas on 27/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WeatherView()
                .tabItem {
                    Image(systemName: "cloud.sun.rain")
                    Text("Weather")
                }
            SkinStoryView()
                .tabItem {
                    Image(systemName: "lightbulb")
                    Text("Insights")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
