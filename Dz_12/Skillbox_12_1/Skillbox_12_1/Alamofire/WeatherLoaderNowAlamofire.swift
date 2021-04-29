//  WeatherLoaderNowAlamofire.swift
//  Skillbox_12_1
//  Created by Nick Gorokhov on 28.02.2021.

import Foundation
import Alamofire

class WeatherLoaderNowAlamofire {
    
    func loadWeatherNowAlamofire(completion: @escaping (WeatherData) -> Void){
        let link: Links = Links()
        AF.request(link.urlWeatherNow).responseData { response in
            guard let weather = response.value else { return }
            var weatherDataNow = WeatherData()
            do{
                weatherDataNow = try JSONDecoder().decode(WeatherData.self, from: weather)
                DispatchQueue.main.async {
                    completion(weatherDataNow)
                }
            } catch{
                print("Error")
            }
        }
    }
}
