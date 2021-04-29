//  ViewController.swift
//  Skillbox_12_1
//  Created by Nick Gorokhov on 24.01.2021.

// Показывает текущую погоду в Москве: https://openweathermap.org/current и на ближайшие 5 дней с интервалом в 3 часа в виде таблицы (тоже для Москвы)

import UIKit

class ViewController: UIViewController {
    
//    MARK:- outlets
    @IBOutlet weak var methodSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var weatherNowView: UIView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
//    MARK:- initialization
    var weatherDataNow = WeatherData()
    var weatherDataFuture = [WeatherDataFuture]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadStandartMethod()
    }
    
//    MARK:- functions
    func updateView(){
        cityLabel.text = weatherDataNow.name
        descriptionLabel.text = DataSource.weatherIDs[weatherDataNow.weather[0].id]
        tempLabel.text = weatherDataNow.main.temp.description + "°"
        tempMinLabel.text = "Мин. " + weatherDataNow.main.temp_min.description + "°"
        tempMaxLabel.text = "Макс. " + weatherDataNow.main.temp_max.description + "°"
    }
    
//    Стадартный метод
    func loadStandartMethod(){
        WeatherLoaderNow().loadWeatherNow { weatherDataNow in
            self.weatherDataNow = weatherDataNow
            self.updateView()
        }
        
        WeatherLoaderFuture().loadWeatherFuture { weatherDataFuture in
            self.weatherDataFuture = weatherDataFuture
            self.tableView.reloadData()
        }
        
        weatherNowView.backgroundColor = .gray
        print("Parsing by standard method")
    }
    
//    Alamofire
    func loadAlamofire(){
        WeatherLoaderNowAlamofire().loadWeatherNowAlamofire { weatherDataNow in
            self.weatherDataNow = weatherDataNow
            self.updateView()
        }
        
        WeatherLoaderFutureAlamofire().loadWeatherFutureAlamofire { weatherDataFuture in
            self.weatherDataFuture = weatherDataFuture
            self.tableView.reloadData()
        }
        
        weatherNowView.backgroundColor = .darkGray
        print("Parsing by the Alamofire")
    }
    
//    MARK:- button's segment control
    @IBAction func pushSegment(_ sender: Any) {
        let getIndex = methodSegmentControl.selectedSegmentIndex
        
        switch getIndex {
        case 0:
            loadStandartMethod()
        case 1:
            loadAlamofire()
        default:
            break
        }
    }
}

//  MARK:- extension
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherDataFuture.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherFutureCell") as! WeatherFutureTableViewCell
        let data = weatherDataFuture[indexPath.row]
        cell.theDateLabel.text = data.dt_txt
        cell.tempFutureLabel.text = data.main.temp.description + "°"
        return cell
    }
}

