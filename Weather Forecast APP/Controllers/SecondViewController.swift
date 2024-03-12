//  SecondViewController.swift
//  Weather Forecast APP
//  Created by Leonardo Oliveira on 13/02/24.

import UIKit
import Foundation

class SecondViewController: UIViewController {
    
    var WeatherData: ResponseBody?
    
    lazy var detailsForecastView = DetailsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        detailsForecastView.loadData(detailsData: WeatherData)
        detailsForecastView.warningsView.loadData(WarningsData: WeatherData)
        detailsForecastView.ForecastTableView.delegate = self
        detailsForecastView.ForecastTableView.dataSource = self
        detailsForecastView.navigationController = self.navigationController
        detailsForecastView.backButton.navigationController = self.navigationController
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        view.addSubview(detailsForecastView)
        detailsForecastView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        detailsForecastView.setConstraintsToParent(view)
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    
   func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeekForecastTableViewCell.identifier, for: indexPath) as? WeekForecastTableViewCell else {
            return UITableViewCell()
        }
        
        if let weekForecast = WeatherData, weekForecast.daily.count >= 1 {
            let dailyWeather = weekForecast.daily[indexPath.row].weather
            
            if let mainWeather = dailyWeather.first?.main {
                let iconImage: UIImage? = {
                    switch mainWeather {
                    case "Clear":
                        return UIImage.smallSunImage
                    case "Rain":
                        return UIImage.smallRainImage
                    case "Clouds":
                        return UIImage.smallCloudImage
                    default:
                        return UIImage.smallRainImage
                    }
                }()
                
                if let weekForecast = WeatherData?.daily[indexPath.row] {
                    cell.WeekLoadData(
                        weekDay: weekForecast.dt.toWeekdayName().uppercased(),
                        min: weekForecast.temp.min.toCelsius(),
                        max: weekForecast.temp.max.toCelsius(),
                        icon: iconImage)
                }
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
    

