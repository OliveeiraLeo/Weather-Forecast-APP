//  LocationButton.swift
//  Weather Forecast APP
//  Created by Leonardo Oliveira on 16/02/24.

import UIKit
import Foundation
import CoreLocation

protocol LocationButtonDelegate: AnyObject {
    func updateLocation(cordinate: CLLocationCoordinate2D)
    }

class LocationButton: UIButton, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    weak var delegate: LocationButtonDelegate?
    
    private func setupLocButton() {
        let image = UIImage.LocButtonIcon
        
        var config = UIButton.Configuration.tinted()
        config.title = "Compartilhar Localização"
        config.image = image
        config.imagePadding = 8
        config.baseForegroundColor = .white
        
        configuration = config
        layer.cornerRadius = 10
        backgroundColor = UIColor.locButtonColor
        addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    @objc private func locationButtonTapped() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleAuthorizationStatusChange), name: NSNotification.Name(rawValue: "CLLocationManagerDidChangeAuthorization"), object: nil)
        locationManager.requestLocation()
    }
    
    @objc private func handleAuthorizationStatusChange() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "CLLocationManagerDidChangeAuthorization"), object: nil)
        if CLLocationManager.locationServicesEnabled() {
            switch locationManager.authorizationStatus {
            case .authorizedWhenInUse, .authorizedAlways:
                locationManager.requestLocation()
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted, .denied:
                print("Autorização negada ou restrita")
            @unknown default:
                break
            }
        } else {
            print("Localização desativada")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
          print("Location Updated")
          let location = locations.first
          delegate?.updateLocation(cordinate: location!.coordinate)
      }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location Manager Error: \(error.localizedDescription)")
    }
    
    init() {
        super.init(frame: .zero)
        setupLocButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
