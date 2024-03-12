//  FirstViewController.swift
//  Weather Forecast APP
//  Created by Leonardo Oliveira on 10/02/24.

import UIKit
import Foundation
import CoreLocation

class FirstViewController: UIViewController {
    
    var weatherData: ResponseBody?
    
    lazy var homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        homeView.button.action = goToWeekForecastView
        homeView.loadData(homeData: weatherData)
        homeView.cityView.loadData(cityData: weatherData)
        homeView.forecastView.loadData(ForecastData: weatherData)
        homeView.indexesView.loadData(indexesData: weatherData)
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(handleLocationUpdated), name: NSNotification.Name(rawValue: "LocationUpdatedNotification"), object: nil)
    }
    
    @objc private func handleLocationUpdated(notification: Notification) {
        if notification.object is [CLLocation] {
            navigationController?.popViewController(animated: true)
        }
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        view.addSubview(homeView)
        homeView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        homeView.setConstraintsToParent(view)
    }
    
    private func goToWeekForecastView() {
        print("Botão clicado!")
        if let navigationController = navigationController, let data = weatherData {
            let secondViewController = SecondViewController()
            secondViewController.WeatherData = data
            navigationController.pushViewController(secondViewController, animated: true)
        } else {
            print("Erro: navigationController é nulo.")
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension FirstViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let weatherData = weatherData, weatherData.hourly.count >= 8 else { return 0 }
        return 8
    }


     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyForecastCollectionViewCell.identifier, for: indexPath) as? HourlyForecastCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let hourlyForecast = weatherData {
            let weather = hourlyForecast.hourly[indexPath.item]
            if let currentWeather = weather.weather.first {
                
                cell.CvloadData(time: weather.dt.toHourFormat().uppercased(),
                                icon: icon(data: currentWeather.main),
                                temp: weather.temp.toCelsius())
            }
        }
        return cell
    }
    private func icon(data: String) -> UIImage? {
            
            switch data {
            case "Clear":
                return UIImage.sunCv
            case "Rain":
                return UIImage.rainCv
            case "Clouds":
                return UIImage.cloudCv
            default:
                return UIImage.moonCv
            }
        }
    }
