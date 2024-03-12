//  LocationViewController.swift
//  Weather Forecast APP
//  Created by Leonardo Oliveira on 16/02/24.

import UIKit
import Foundation
import CoreLocation

class LocationViewController: UIViewController {
    
    var isLoading = false
    
    let locationView = LocationView()
    var receivedLocations: [CLLocation]?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        locationView.navigationController = self.navigationController
        locationView.locationButton.delegate = self
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        view.addSubview(locationView)
        locationView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        locationView.setConstraintsToParent(view)
    }
}

extension LocationViewController: LocationButtonDelegate {
    func updateLocation(cordinate: CLLocationCoordinate2D) {
        guard !isLoading else {return}
        isLoading = true
        let manager = WeatherManager()
        manager.getCurrentWeather(latitude: cordinate.latitude, longitude: cordinate.longitude) { [weak self] response in
                      guard let self else { return }
                      let firstViewController = FirstViewController()
                      firstViewController.weatherData = response
            navigationController?.pushViewController(firstViewController, animated: true)
                
            self.isLoading = false
        }
    }
}
