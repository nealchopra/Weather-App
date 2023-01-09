//
//  WeatherView.swift
//  Weather App
//
//  Created by Neal Chopra on 1/7/23.
//

import SwiftUI

struct WeatherView: View
{
    var weather: ResponseBody
    var body: some View
    {
        ZStack(alignment: .leading)
        {
            VStack
            {
                VStack(alignment: .leading, spacing: 5)
                {
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                
                VStack
                {
                    HStack
                    {
                        VStack(spacing: 20)
                        {
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            
                            Text("\(weather.weather[0].main)")
                        }
                        .frame(width: 150, alignment: .leading)
                        .padding()
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height:  80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png"))
                    {
                        image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    }
                    placeholder:
                    {
                        ProgressView()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack
            {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20)
                {
                    Text("Current weather")
                        .bold()
                        .padding(.bottom)
                    HStack
                    {
                        WeatherRow(logo: "thermometer.low", name: "Min temp", value:(weather.main.tempMin.roundDouble()) + "º")
                        Spacer()
                        WeatherRow(logo: "thermometer.high", name: "Max temp", value:(weather.main.tempMax.roundDouble()) + "º")
                    }
                    
                    HStack
                    {
                        WeatherRow(logo: "wind", name: "Wind speed", value:(weather.wind.speed.roundDouble()) + " mph")
                        Spacer()
                        WeatherRow(logo: "humidity.fill", name: "Humidity", value:(weather.main.humidity.roundDouble()) + "%")
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.604, brightness: 0.344))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.604, brightness: 0.344))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider
{
    static var previews: some View
    {
        WeatherView(weather: previewWeather)
    }
}
