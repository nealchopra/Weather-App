//
//  ContentView.swift
//  Weather App
//
//  Created by Neal Chopra on 1/7/23.
//

import SwiftUI

struct ContentView: View
{
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View
    {
        VStack
        {
            if let location = locationManager.location
            {
                if let weather = weather
                {
                    WeatherView(weather: weather)
                } else
                {
                    LoadingView()
                        .task
                    {
                            do
                            {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }
                            catch
                            {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            }
            else
            {
                if locationManager.isLoading
                {
                    LoadingView()
                }
                else
                {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.656, saturation: 0.604, brightness: 0.344))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
