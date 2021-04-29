//  WeatherLoaderFuture.swift
//  Skillbox_12_1
//  Created by Nick Gorokhov on 27.02.2021.

import Foundation

class WeatherLoaderFuture {
    
    //    Функция парсинга погоды на 5 дней вперед с интервалом в 3 часа
        func loadWeatherFuture(completion: @escaping ([WeatherDataFuture]) -> Void) {
            let link: Links = Links()
            let url2 = URL(string: link.urlkWeatherFuture)!
            let request = URLRequest(url: url2)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    var weatherDataFuture = [WeatherDataFuture]()
                    do {
                        let weather = try JSONDecoder().decode(List.self, from: data)
                        DispatchQueue.main.async {
                            if let list = weather.list.first{
                                let string = String(list.main.temp)
                            }
                            weatherDataFuture = weather.list
                            completion(weatherDataFuture)
                        }
                    } catch {
                        print(error)
                        return
                    }
                }
            }.resume()
        }
}
