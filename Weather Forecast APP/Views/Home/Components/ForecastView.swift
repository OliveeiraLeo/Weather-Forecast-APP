//  ForecastView.swift
//  Weather Forecast APP
//  Created by Leonardo Oliveira on 10/02/24.

import UIKit
import Foundation

class ForecastView: UIView {
    
    private lazy var forecastView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
     }()
    
    private lazy var weatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 100, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadData(ForecastData: ResponseBody?) {
        
        guard let temperature = ForecastData?.current.temp else { return }
        temperatureLabel.text = temperature.toCelsius()
        
        if let forecastData = ForecastData, forecastData.daily.count >= 1 {
                let firstDailyWeather = forecastData.daily[0].weather
                if let mainWeather = firstDailyWeather.first?.main {
                    switch mainWeather {
                    case "Clear":
                        weatherIcon.image = UIImage.sunImage
                        descriptionLabel.text = "Dia Ensolarado"
                    case "Rain":
                        weatherIcon.image = UIImage.rainImage
                        descriptionLabel.text = "Dia Chuvoso"
                    case "Clouds":
                        weatherIcon.image = UIImage.cloudImage
                        descriptionLabel.text = "Dia Nublado"
                    default:
                        weatherIcon.image = UIImage.moonImage
                        descriptionLabel.text = "Está a noite"
                        break
                    }
                }
            }
        }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
        
    }
    
    private func setHierarchy(){
        addSubview(forecastView)
        forecastView.addSubview(weatherIcon)
        forecastView.addSubview(descriptionLabel)
        forecastView.addSubview(temperatureLabel)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            weatherIcon.topAnchor.constraint(equalTo: forecastView.topAnchor, constant: 10),
            weatherIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            weatherIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            weatherIcon.heightAnchor.constraint(equalToConstant: 220)
            
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: weatherIcon.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 25)
            
        ])
        
        
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            temperatureLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            temperatureLabel.heightAnchor.constraint(equalToConstant: 120)
            
        ])
    }
}
