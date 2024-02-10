//
//  ContentView.swift
//  hackWeatherApp
//
//  Created by Daniel Peláez on 09/02/24.
//

import SwiftUI
import WeatherKit
import CoreLocation

class WeatherViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var currentWeather: CurrentWeather?
    private let weatherService = WeatherService.shared
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func fetchWeather(for location: CLLocation) {
        Task {
            do {
                let weather = try await weatherService.weather(for: location)
                DispatchQueue.main.async { [weak self] in
                    self?.currentWeather = weather.currentWeather
                }
            } catch {
                print("Error fetching weather: \(error)")
            }
        }
    }
    
    // CLLocationManagerDelegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            fetchWeather(for: location)
            locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location: \(error)")
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.requestLocation()
        default:
            // Handle other authorization states if necessary
            break
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var ImageName: String
    var Temperature: Int
    
    var body: some View {
        VStack(spacing: 6){
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: ImageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                //.foregroundStyle(.white, .yellow, .gray)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(Temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct Backgroundview: View {
    
    var isNight: Bool
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight
//                                                   ? .gray : Color("lightskyblue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View{
    var cityName: String
    
    var body: some View{
        Text(cityName)
            .font(.system(size:32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding() //create a frame for your stack
    }
}

struct mainWeatherView: View{
    var imageName: String
    var temperature: Int
    
    var body: some View{
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
    
        Text("\(temperature)°")
            .font(.system(size: 70, weight: .medium))
            .foregroundColor(.white)
            
    }
}

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View{
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(15.0)
            .shadow(radius: 4)
    }
}

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var isNight = false

    var body: some View {
        ZStack {
            Backgroundview(isNight: isNight)
            VStack {
                CityTextView(cityName: "Mixcoac, Ciudad de México")
                
                if let currentWeather = viewModel.currentWeather {
                    mainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                    temperature: Int(currentWeather.temperature.value))
                } else {
                    // Provide a placeholder or loading view
                    ProgressView()
                }
                
                // Your existing code for WeatherDayView and the button
                // .
                
            }
        }
    }
}
