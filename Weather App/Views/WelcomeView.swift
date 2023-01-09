//
//  WelcomeView.swift
//  Weather App
//
//  Created by Neal Chopra on 1/7/23.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View
{
    @EnvironmentObject var locationManager:
        LocationManager
    var body: some View
    {
        VStack
        {
            VStack(spacing: 20)
            {
                Text("Welcome to Cloud Watch")
                    .bold().font(.title)
                
                Text("Get real-time weather data for your location with this simple app. Please share your location to see current temperature and other weather conditions.").padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation)
            {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider
{
    static var previews: some View
    {
        WelcomeView()
    }
}
