//  ViewControllerAlamofire.swift
//  Skillbox_12_1
//  Created by Nick Gorokhov on 28.02.2021.

import UIKit

class ViewControllerAlamofire: UIViewController {
    
    @IBOutlet weak var cityLabelAlamofire: UILabel!
    @IBOutlet weak var descriptionLabelAlamofire: UILabel!
    @IBOutlet weak var tempLabelAlamofire: UILabel!
    @IBOutlet weak var tempMinLabelalamofire: UILabel!
    @IBOutlet weak var tempMaxLabelAlamofire: UILabel!
    
    @IBOutlet weak var tableViewAlamofire: UITableView!
    
    var weatherDataNowAlamofire = WeatherData()
    var weatherDataFutureAlamofire = [WeatherDataFuture]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    func updateView(){
        cityLabelAlamofire.text = weatherDataNowAlamofire.name
        descriptionLabelAlamofire.text = DataSource.weatherIDs[weatherDataNowAlamofire.weather[0].id]
        tempLabelAlamofire.text = weatherDataNowAlamofire.main.temp.description + "°"
        tempMinLabelalamofire.text = "Мин. " + weatherDataNowAlamofire.main.temp_min.description + "°"
        tempMaxLabelAlamofire.text = "Макс. " + weatherDataNowAlamofire.main.temp_max.description + "°"
    }
}

extension ViewControllerAlamofire: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherDataFutureAlamofire.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherFutureAlamofireCell") as! WeatherFutureTableViewCellAlamofire
        let data = weatherDataFutureAlamofire[indexPath.row]
        cell.theDateLabelAlmofire.text = data.dt_txt
        cell.tempFutureLabelAlmofire.text = data.main.temp.description + "°"
        return cell
    }
    
    
}

