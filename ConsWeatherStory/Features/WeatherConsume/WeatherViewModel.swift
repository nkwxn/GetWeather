//
//  WeatherViewModel.swift
//  ConsWeatherStory
//
//  Created by Nicholas on 27/10/21.
//

import Foundation
import CoreLocation
import MapKit

class WeatherViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var fetchStatus: FetchWeatherStatus = .loading
    @Published var tempString = "32°C"
    @Published var weatherDesc = "Cloudy"
    @Published var title = "Loading"
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    var locationManager: CLLocationManager?
    
    // MARK: - Check the Location Services if it's enabled
    func checkLocationEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            checkLocationAuthorization()
//            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            print("kalo service nya ga enabled, error ditaro disini")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager
        else {
            return
        }
        
        switch locationManager.authorizationStatus {
        // open the permission window
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Location restricted likely due to parental control")
            self.fetchStatus = .error
        case .denied:
            print("Permission denied. Please go to settings")
            self.fetchStatus = .error
        // when it is on, load everything
        case .authorizedAlways, .authorizedWhenInUse:
            self.region = MKCoordinateRegion(
                center: locationManager.location!.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            )
            loadWeather()
        @unknown default:
            break
        }
    }
    
    // MARK: - Load weather from the API
    func loadWeather() {
        guard let locationManager = locationManager
        else {
            return
        }
        self.fetchStatus = .loading
        
        APIRequest.fetchWeather(coordinate: locationManager.location!.coordinate) { data in
            self.updateWeatherData(data)
        } failCompletion: { error in
            print(error)
            self.fetchStatus = .error
        }
    }
    
    // MARK: - Update the label to the current temperature
    func updateWeatherData(_ data: FetchedData) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            if NSLocale.autoupdatingCurrent.identifier.hasSuffix("US") {
                self.tempString = "\(data.main.temp)°F"
            } else {
                self.tempString = "\(data.main.temp)°C"
            }
            self.title = "Weather @\(data.name)"
            self.weatherDesc = data.weather[0].main
        }
        self.fetchStatus = .done
    }
    
    enum FetchWeatherStatus {
        case loading, done, error
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
