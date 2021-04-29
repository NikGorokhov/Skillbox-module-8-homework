//  WeatherData.swift
//  Skillbox_12_1
//  Created by Nick Gorokhov on 24.01.2021.

import Foundation

struct Weather: Codable{
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct Main: Codable {
    var temp: Double = 0
    var temp_min: Double = 0
    var temp_max: Double = 0
}

struct WeatherData: Codable {
    var weather: [Weather] = []
    var main: Main = Main()
    var name: String = ""
}


