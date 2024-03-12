//  WeekForecastTableViewCell.swift
//  Weather Forecast APP
//  Created by Leonardo Oliveira on 14/02/24.

import UIKit
import Foundation

class WeekForecastTableViewCell: UITableViewCell {
    
    static let identifier: String = "DailyForecast"
     
    private lazy var stackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [weekDayLabel, maxTemperatureLabel, minTemperatureLabel, iconImageView])
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.backgroundColor = .clear
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        return stackView
        
    }()
    
    private lazy var weekDayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
        
    private lazy var minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
        
    }()
        
    private lazy var maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
        
    }()
        
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .right
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    func WeekLoadData(weekDay: String?, min: String?, max: String?, icon: UIImage?) {
            weekDayLabel.text = weekDay
            minTemperatureLabel.text = min
            maxTemperatureLabel.text = max
            iconImageView.image = icon
        }
        
        private func setupView() {
            setHierarchy()
            setConstraints()
            selectionStyle = .none
            backgroundColor = .clear
            
        }
        
        private func setHierarchy() {
            contentView.addSubview(stackView)
    
        }
        
    private func setConstraints() {
        
        stackView.setConstraintsToParent(contentView)
            
        NSLayoutConstraint.activate([
            weekDayLabel.widthAnchor.constraint(equalToConstant: 150),
            weekDayLabel.heightAnchor.constraint(equalToConstant: 30)
            
        ])
        
        NSLayoutConstraint.activate([
            maxTemperatureLabel.widthAnchor.constraint(equalToConstant: 85),
            maxTemperatureLabel.heightAnchor.constraint(equalToConstant: 30),
    
        ])
        
        NSLayoutConstraint.activate([
            minTemperatureLabel.widthAnchor.constraint(equalToConstant: 85),
            minTemperatureLabel.heightAnchor.constraint(equalToConstant: 30),
            
        ])
        
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: "DailyForecast")
            setupView()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
