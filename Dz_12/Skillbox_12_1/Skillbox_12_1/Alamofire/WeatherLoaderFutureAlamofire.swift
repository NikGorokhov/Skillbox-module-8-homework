//  WeatherLoaderFutureAlamofire.swift
//  Skillbox_12_1
//  Created by Nick Gorokhov on 28.02.2021.

import Foundation
import Alamofire

class WeatherLoaderFutureAlamofire{
    
    func loadWeatherFutureAlamofire(completion: @escaping ([WeatherDataFuture]) -> Void) {
        let link: Links = Links()
        AF.request(link.urlkWeatherFuture).responseData { (response) in
            switch response.result {
            
            case .success(let data):
                var weatherDataFutureAlam = [WeatherDataFuture]()
                do {
                    let weather = try JSONDecoder().decode(List.self, from: data )
                    DispatchQueue.main.async {
                        if let list = weather.list.first{
                            let string = String(list.main.temp)
                        }
                        weatherDataFutureAlam = weather.list
                        completion(weatherDataFutureAlam)
                    }
                } catch {
                    print("error")
                    return
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

