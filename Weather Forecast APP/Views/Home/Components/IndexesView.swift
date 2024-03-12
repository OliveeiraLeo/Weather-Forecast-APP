//  IndexesView.swift
//  Weather Forecast APP
//  Created by Leonardo Oliveira on 10/02/24.

import UIKit
import Foundation

class IndexesView: UIView {
          
    private lazy var indexesView: UIView = {
        let view = UIView()
        view.backgroundColor = .fadedGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var windIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = .windImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var windLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var humidityIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .humidityImage
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var minTemperatureIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = .minTempImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var maxTemperatureIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = .maxTempImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
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
    
    func loadData(indexesData: ResponseBody?) {
        
        if let current = indexesData?.current {
            let windMS = current.windSpeed
            let windKMH = Int(round(windMS * 3.6))
            windLabel.text = "\(windKMH) km/h"
            
            humidityLabel.text = " \(current.humidity) %"
        }

        
        if let IndexesData = indexesData, IndexesData.daily.count >= 2 {
            let secondDaily = indexesData?.daily[1]
            let minTemperature = secondDaily?.temp.min
            let maxTemperature = secondDaily?.temp.max
            
            minTemperatureLabel.text = minTemperature?.toCelsius()
            maxTemperatureLabel.text = maxTemperature?.toCelsius()
        }
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()

    }
    
    private func setHierarchy() {
        addSubview(indexesView)
        
        indexesView.addSubview(windIcon)
        indexesView.addSubview(windLabel)
        indexesView.addSubview(humidityIcon)
        indexesView.addSubview(humidityLabel)
        indexesView.addSubview(minTemperatureIcon)
        indexesView.addSubview(minTemperatureLabel)
        indexesView.addSubview(maxTemperatureIcon)
        indexesView.addSubview(maxTemperatureLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            maxTemperatureIcon.topAnchor.constraint(equalTo: indexesView.topAnchor, constant: 10),
            maxTemperatureIcon.leadingAnchor.constraint(equalTo: indexesView.leadingAnchor, constant: 40),
            maxTemperatureIcon.heightAnchor.constraint(equalToConstant: 25)
        
        ])
        NSLayoutConstraint.activate([
            maxTemperatureLabel.topAnchor.constraint(equalTo: maxTemperatureIcon.topAnchor),
            maxTemperatureLabel.leadingAnchor.constraint(equalTo: maxTemperatureIcon.leadingAnchor, constant: 25),
            maxTemperatureLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        NSLayoutConstraint.activate([
            minTemperatureIcon.centerXAnchor.constraint(equalTo: maxTemperatureIcon.centerXAnchor, constant: 125),
            minTemperatureIcon.topAnchor.constraint(equalTo: maxTemperatureIcon.topAnchor),
            minTemperatureIcon.heightAnchor.constraint(equalToConstant: 25)
        
        ])
        NSLayoutConstraint.activate([
            minTemperatureLabel.topAnchor.constraint(equalTo: maxTemperatureIcon.topAnchor),
            minTemperatureLabel.leadingAnchor.constraint(equalTo: minTemperatureIcon.leadingAnchor, constant: 25),
            minTemperatureLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        NSLayoutConstraint.activate([
            windIcon.topAnchor.constraint(equalTo: indexesView.topAnchor, constant: 40),
            windIcon.leadingAnchor.constraint(equalTo: indexesView.leadingAnchor, constant: 37),
            windIcon.heightAnchor.constraint(equalToConstant: 20)
    
        ])
        NSLayoutConstraint.activate([
            windLabel.topAnchor.constraint(equalTo: windIcon.topAnchor),
            windLabel.leadingAnchor.constraint(equalTo: windIcon.leadingAnchor, constant: 25),
            windLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        NSLayoutConstraint.activate([
            humidityIcon.centerXAnchor.constraint(equalTo: windIcon.centerXAnchor, constant: 130),
            humidityIcon.topAnchor.constraint(equalTo: windIcon.topAnchor),
            humidityIcon.heightAnchor.constraint(equalToConstant: 20)
        
        ])
        NSLayoutConstraint.activate([
            humidityLabel.topAnchor.constraint(equalTo: windIcon.topAnchor),
            humidityLabel.leadingAnchor.constraint(equalTo: humidityIcon.leadingAnchor, constant: 25),
            humidityLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
}
