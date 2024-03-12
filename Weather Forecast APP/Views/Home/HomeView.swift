//  FirstView.swift
//  Weather Forecast APP
//  Created by Leonardo Oliveira on 13/02/24.

import UIKit
import ObjectiveC
import Foundation

class HomeView: UIView {
    
    var navigationController: UINavigationController?
    
    lazy var cityView = CityView()
    lazy var button = HomeButton()
    lazy var indexesView = IndexesView()
    lazy var forecastView = ForecastView()
    lazy var hourlyCvCell = HourlyForecastCollectionViewCell()
    
    private lazy var firstView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var forecastLabel: UILabel = {
        let label = UILabel()
        label.text = "Previsão Para as Próximas Horas"
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.backgroundColor = .fadedWhite
        label.font = UIFont.systemFont(ofSize: 15, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let Layout = UICollectionViewFlowLayout()
        Layout.scrollDirection = .horizontal
        Layout.itemSize = CGSize(width: 110, height: 160)
        Layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: Layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HourlyForecastCollectionViewCell.self, forCellWithReuseIdentifier: "HourlyForecast")
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        addSubview(firstView)
        firstView.addSubview(button)
        firstView.addSubview(cityView)
        firstView.addSubview(forecastView)
        firstView.addSubview(indexesView)
        firstView.addSubview(forecastLabel)
        firstView.addSubview(collectionView)
        
        setDetails()
    }
    
    private func setDetails() {
        indexesView.layer.cornerRadius = 15
        indexesView.layer.masksToBounds = true
        indexesView.backgroundColor = .fadedWhite
        
        button.translatesAutoresizingMaskIntoConstraints = false
        cityView.translatesAutoresizingMaskIntoConstraints = false
        indexesView.translatesAutoresizingMaskIntoConstraints = false
        forecastView.translatesAutoresizingMaskIntoConstraints = false
        forecastLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func loadData(homeData: ResponseBody?) {
        
        if let HomeData = homeData, HomeData.daily.count >= 1 {
            let Weather = HomeData.daily[0].weather
            
            if let mainWeather = Weather.first?.main {
                switch mainWeather {
                case "Clear":
                    firstView.backgroundColor = .SunColor
                case "Rain":
                    firstView.backgroundColor = .RainColor
                case "Clouds":
                    firstView.backgroundColor = .CloudColor
                default:
                    firstView.backgroundColor = .NightColor
                    break
                }
            }
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: topAnchor),
            firstView.leadingAnchor.constraint(equalTo: leadingAnchor),
            firstView.trailingAnchor.constraint(equalTo: trailingAnchor),
            firstView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
        NSLayoutConstraint.activate([
            cityView.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            cityView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cityView.widthAnchor.constraint(equalToConstant: 250),
            cityView.heightAnchor.constraint(equalToConstant: 45)
            
        ])
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: cityView.topAnchor, constant: 3),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            button.widthAnchor.constraint(equalToConstant: 30),
            button.heightAnchor.constraint(equalToConstant: 30)
            
        ])
        NSLayoutConstraint.activate([
            forecastView.topAnchor.constraint(equalTo: cityView.bottomAnchor, constant: 20),
            forecastView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            forecastView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            forecastView.heightAnchor.constraint(equalToConstant: 400)
            
        ])
        NSLayoutConstraint.activate([
            indexesView.topAnchor.constraint(equalTo: forecastView.bottomAnchor, constant: 15),
            indexesView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            indexesView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            indexesView.heightAnchor.constraint(equalToConstant: 70)
            
        ])
        NSLayoutConstraint.activate([
            forecastLabel.topAnchor.constraint(equalTo: indexesView.bottomAnchor, constant: 20),
            forecastLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            forecastLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            forecastLabel.heightAnchor.constraint(equalToConstant: 30)
            
        ])
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: forecastLabel.bottomAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
