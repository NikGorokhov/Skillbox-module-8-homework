//  WeatherLoader.swift
//  Skillbox_12_1
//  Created by Nick Gorokhov on 25.02.2021.

import Foundation

class WeatherLoaderNow {
   
    //    Функция парсинга погоды в данный момент
    func loadWeatherNow(completion: @escaping (WeatherData) -> Void){
        let link: Links = Links()
        let url = URL(string: link.urlWeatherNow)!
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard error == nil else {
                    print("DataTask error")
                    return
                }
                var weatherDataNow = WeatherData()
                do{
                    weatherDataNow = try JSONDecoder().decode(WeatherData.self, from: data!)
                    DispatchQueue.main.async {
                        completion(weatherDataNow)
                        
                    }
                } catch{
                    print("Error")
                }
            }.resume()
        }
}
