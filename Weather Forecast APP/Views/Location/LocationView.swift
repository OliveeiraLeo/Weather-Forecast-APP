//  LocationView.swift
//  Weather Forecast APP
//  Created by Leonardo Oliveira on 16/02/24.

import UIKit
import Foundation
import CoreLocation

class LocationView: UIView {
    
    var navigationController: UINavigationController?
    
    let locationButton = LocationButton()
    var locationManager = CLLocationManager()
    
    private lazy var locView: UIView = {
        let view = UIView()
        view.backgroundColor = .FontColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Bem vindo ao Weather App"
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private lazy var instructionLabel: UILabel = {
        let label = UILabel()
        label.text = "Por favor, clique no botão abaixo e compartilhe sua localização para ver o clima na sua área"
        label.numberOfLines = 3
        label.textColor = .white
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        addSubview(locView)
        
        locView.addSubview(welcomeLabel)
        locView.addSubview(instructionLabel)
        locView.addSubview(locationButton)
        locationButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            locView.topAnchor.constraint(equalTo: topAnchor),
            locView.leadingAnchor.constraint(equalTo: leadingAnchor),
            locView.trailingAnchor.constraint(equalTo: trailingAnchor),
            locView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 350),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 40)
            
        ])
        NSLayoutConstraint.activate([
            instructionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10),
            instructionLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor, constant: 45),
            instructionLabel.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor, constant: -45),
            instructionLabel.heightAnchor.constraint(equalToConstant: 80)
            
        ])
        NSLayoutConstraint.activate([
            locationButton.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 15),
            locationButton.leadingAnchor.constraint(equalTo: instructionLabel.leadingAnchor, constant: 25),
            locationButton.trailingAnchor.constraint(equalTo: instructionLabel.trailingAnchor, constant: -25),
            locationButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
