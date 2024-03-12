//  CityView.swift
//  Weather Forecast APP
//  Created by Leonardo Oliveira on 10/02/24.

import UIKit
import Foundation

class CityView: UIView {
    
    private lazy var cityView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var locIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .LocIcon
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
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
    
    func loadData(cityData: ResponseBody?) {
        if let timezone = cityData?.timezone {
            let components = timezone.components(separatedBy: "/")
            if components.count > 1 {
                let cityString = components[1]
                let cleanString = cityString.replacingOccurrences(of: "_", with: " ")
                cityLabel.text = cleanString
                } else {
            }
        }
    }
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        addSubview(cityView)
        cityView.addSubview(locIcon)
        cityView.addSubview(cityLabel)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: cityView.topAnchor, constant: 5),
            cityLabel.leadingAnchor.constraint(equalTo: locIcon.leadingAnchor, constant: 45),
            cityLabel.heightAnchor.constraint(equalToConstant: 30)
            
        ])
        NSLayoutConstraint.activate([
            locIcon.topAnchor.constraint(equalTo: topAnchor),
            locIcon.leadingAnchor.constraint(equalTo: cityView.leadingAnchor, constant: 15),
            locIcon.widthAnchor.constraint(equalToConstant: 40),
            locIcon.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
