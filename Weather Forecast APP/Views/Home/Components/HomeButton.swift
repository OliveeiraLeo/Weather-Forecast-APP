//  FirstViewButtonClass.swift
//  Weather Forecast APP
//  Created by Leonardo Oliveira on 15/02/24.

import UIKit
import Foundation
import ObjectiveC

protocol HomeButtonDelegate: AnyObject {
    func goToWeekForecastView()
}

class HomeButton: UIButton {
    
    var action:(() -> Void)?
    
    weak var delegate: HomeButtonDelegate?
    
    var data: ResponseBody?
    var navigationController: UINavigationController?
    
    func setupButton() {
        setImage(UIImage.calendarImage, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(goToWeekForecastView), for: .touchUpInside)
    }
    
    @objc func goToWeekForecastView() {
        action?()
    }
    
    init() {
    super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

