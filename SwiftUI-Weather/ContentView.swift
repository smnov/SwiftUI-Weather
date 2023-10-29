//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Александр Семенов on 28.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : Color("lightBlue") )
            VStack {
                CityTextView(cityName: "Irkutsk, Russia")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "sunset.fill", temperature: 10)
                
                HStack(spacing: 15) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: isNight ? "cloud.moon.fill" : "sunset.fill", temperature: 15)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.hail.fill", temperature: 6)
                    WeatherDayView(dayOfWeek: "THU", imageName: isNight ? "cloud.fill" : "cloud.sun.fill", temperature: 11)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "wind.snow", temperature: 6)
                    WeatherDayView(dayOfWeek: "SAT", imageName: isNight ? "moon.fill" : "sun.max.fill", temperature: 20)
                }
                Spacer()
                Button {
                    isNight.toggle() // func of a button
                } label: { // look of a button
                    WeatherButton(title: "Change the day", textColor: .blue, backgroundColor: .white)
                    
                }
                Spacer()
            }
        }
    }
    
    }
    struct WeatherDayView: View {
        
        var dayOfWeek: String
        var imageName: String
        var temperature: Int
        
        var body: some View {
            VStack {
                Text(dayOfWeek)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Text("\(temperature)°")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundColor(.white)
            }
        }
    }

    
    #Preview {
        ContentView()
    }
    
    struct BackgroundView: View {
        
        var topColor: Color
        var bottomColor: Color
        
        var body: some View {
            
            LinearGradient(gradient: Gradient(
                colors: [topColor, bottomColor]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
    }
    
    
    struct CityTextView: View {
        
        var cityName: String
        
        var body: some View {
            Text(cityName)
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
    
    
    struct MainWeatherStatusView: View {
        
        var imageName: String
        var temperature: Int
        
        var body: some View {
            VStack(spacing: 8) {
                Image(systemName: imageName)
                    .renderingMode(.original )
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                Text("\(temperature)°")
                    .font(.system(size: 70, weight: .medium))
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
            }
        }
    }
    

