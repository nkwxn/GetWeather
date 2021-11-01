//
//  WeatherView.swift
//  ConsWeatherStory
//
//  Created by Nicholas on 27/10/21.
//

import SwiftUI
import MapKit

// OpenWeather API Key: fa9de5a37723a15c5c068a8ab22415b8
struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            switch viewModel.fetchStatus {
            case .loading:
                ProgressView()
                    .progressViewStyle(.circular)
                    .onAppear {
                        viewModel.checkLocationEnabled()
                    }
            case .done:
                VStack {
                    HStack {
                        Image(systemName: "cloud")
                            .font(.system(size: 64))
                        VStack(alignment: .leading) {
                            Text(viewModel.weatherDesc)
                                .font(.title3)
                                .fontWeight(.bold)
                            Text(viewModel.tempString)
                                .font(.title3)
                                .fontWeight(.bold)
                            Text("Don’t forget to moisturize your skin or the UV will flare you up!")
                                .font(.body)
                        }
                    }
                    Text("Weather data provided by OpenWeather")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                    Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                }
                .navigationTitle(viewModel.title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: viewModel.loadWeather) {
                            Image(systemName: "arrow.clockwise")
                        }
                    }
                }
                .padding(.horizontal)
            case .error:
                Text("404: Not found")
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
