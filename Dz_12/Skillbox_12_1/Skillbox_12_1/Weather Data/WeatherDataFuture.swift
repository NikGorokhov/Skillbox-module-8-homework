//  WeatherDataFuture.swift
//  Skillbox_12_1
//  Created by Nick Gorokhov on 28.01.2021.

import Foundation

struct MainF: Codable {
    var temp: Double
}

struct WeatherDataFuture: Codable {
    var main: MainF
    var dt_txt: String
}

struct List: Codable {
    var list: [WeatherDataFuture]
}

