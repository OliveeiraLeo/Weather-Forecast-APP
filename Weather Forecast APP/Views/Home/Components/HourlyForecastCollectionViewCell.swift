//  HourlyForecastCollectionViewCell.swift
//  Weather Forecast APP
//  Created by Leonardo Oliveira on 11/02/24.

import UIKit
import Foundation

class HourlyForecastCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "HourlyForecast"
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [hourLabel, iconImageView, temperatureLabel])
        stackView.spacing = 15
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.layer.cornerRadius = 10
        stackView.layer.borderColor = .none
        stackView.backgroundColor = UIColor.fadedWhite
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 15, leading: 10, bottom: 5, trailing: 10)
        return stackView
        
    }()
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .thin)
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    private lazy var temperatureLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .thin)
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func CvloadData(time: String?, icon: UIImage?, temp: String?) {
         hourLabel.text = time
         iconImageView.image = icon
         temperatureLabel.text = temp
     }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        contentView.addSubview(stackView)
    }
    
    private func setConstraints() {
        
        stackView.setConstraintsToParent(contentView)
        
        NSLayoutConstraint.activate([
            hourLabel.heightAnchor.constraint(equalToConstant: 25),
            iconImageView.heightAnchor.constraint(equalToConstant: 55),
    
        ])
    }
}
