//  WarningsView.swift
//  Weather Forecast APP
//  Created by Leonardo Oliveira on 14/02/24.

import UIKit
import Foundation

class WarningsView: UIView {
    
    private lazy var warningView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Alguns minutos atrás"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var responseLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var WeatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadData(WarningsData: ResponseBody?) {
        
        if let warningsData = WarningsData, warningsData.daily.count >= 1 {
            let dailyWeather = warningsData.daily[0].weather
            
            if let MainWeather = dailyWeather.first?.main {
                switch MainWeather {
                case "Clear":
                    WeatherIcon.image = UIImage.sunImage
                    responseLabel.text = "Dia Ensolarado, cuidado! Não esqueça o protetor solar"
                case "Rain":
                    WeatherIcon.image = UIImage.rainImage
                    responseLabel.text = "Dia Chuvoso, cuidado! Não esqueça seu guarda-chuva"
                case "Clouds":
                    WeatherIcon.image = UIImage.cloudImage
                    responseLabel.text = "Dia Nublado, céu cinzento e poucos raios solares"
                default:
                    WeatherIcon.image = UIImage.moonImage
                    responseLabel.text = "Está a noite, descanse e tenha bons sonhos!"
                    break
                }
            }
        }
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        addSubview(warningView)
        warningView.addSubview(timeLabel)
        warningView.addSubview(WeatherIcon)
        warningView.addSubview(responseLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            timeLabel.widthAnchor.constraint(equalToConstant: 150),
            timeLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        NSLayoutConstraint.activate([
            responseLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 5),
            responseLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            responseLabel.widthAnchor.constraint(equalToConstant: 230),
            responseLabel.heightAnchor.constraint(equalToConstant: 65)
            
        ])
        NSLayoutConstraint.activate([
            WeatherIcon.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            WeatherIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            WeatherIcon.heightAnchor.constraint(equalToConstant: 100),
            WeatherIcon.widthAnchor.constraint(equalToConstant: 100)
            
        ])
    }
}
