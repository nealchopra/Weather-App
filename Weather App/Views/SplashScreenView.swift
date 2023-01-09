//
//  SplashScreenView.swift
//  Weather App
//
//  Created by Neal Chopra on 1/8/23.
//

import SwiftUI

struct SplashScreenView: View
{
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View
    {
        if isActive
        {
            ContentView()
        }
        else
        {
            ZStack
            {
                Color(hue: 0.656, saturation: 0.604, brightness: 0.344)
                    .edgesIgnoringSafeArea(.all)
                
                VStack
                {
                    VStack
                    {
                        Image(systemName:"cloud.fill")
                            .font(.system(size: 100))
                            .foregroundColor(Color(hue: 0.572, saturation: 0.361, brightness: 0.956))
                            .padding(.bottom)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear
                    {
                        withAnimation(.easeIn(duration: 1.2))
                        {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                    .onAppear
                    {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0)
                        {
                            withAnimation
                            {
                                self.isActive = true
                            }
                        }
                    }
                }
            }
        }
    }
}


struct SplashScreenView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SplashScreenView()
    }
}
