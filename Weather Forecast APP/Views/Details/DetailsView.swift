//  SecondView.swift
//  Weather Forecast APP
//  Created by Leonardo Oliveira on 13/02/24.

import UIKit
import ObjectiveC
import Foundation

class DetailsView: UIView {
    
    var navigationController: UINavigationController?
    
    lazy var warningsView = WarningsView()
    lazy var backButton = SecondViewButton()
    
    private lazy var secondView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.SVColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        return label
    }()
    
    private lazy var weekLabel: UILabel = {
        let label = UILabel()
        label.text = "Próxima Semana"
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var ForecastTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .clear
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.register(WeekForecastTableViewCell.self, forCellReuseIdentifier: "DailyForecast")
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadData(detailsData: ResponseBody?) {
        if let timezone = detailsData?.timezone {
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
    
    private func setHierarchy(){
        addSubview(secondView)
        secondView.addSubview(cityLabel)
        secondView.addSubview(warningsView)
        secondView.addSubview(weekLabel)
        secondView.addSubview(ForecastTableView)
        secondView.addSubview(backButton)
        setDetails()
    }
    
    private func setDetails() {
        warningsView.layer.cornerRadius = 15
        warningsView.layer.masksToBounds = true
        warningsView.backgroundColor = UIColor.fadedGray
        warningsView.translatesAutoresizingMaskIntoConstraints = false
        ForecastTableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            secondView.topAnchor.constraint(equalTo: topAnchor),
            secondView.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondView.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: secondView.topAnchor, constant: 80),
            cityLabel.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 60),
            cityLabel.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -60),
            cityLabel.heightAnchor.constraint(equalToConstant: 35)
            
        ])
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: cityLabel.topAnchor, constant: 5),
            backButton.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 25),
            backButton.widthAnchor.constraint(equalToConstant: 25),
            backButton.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        NSLayoutConstraint.activate([
            warningsView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 40),
            warningsView.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 20),
            warningsView.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -20),
            warningsView.heightAnchor.constraint(equalToConstant: 150)
            
        ])
        NSLayoutConstraint.activate([
            weekLabel.topAnchor.constraint(equalTo: warningsView.bottomAnchor, constant: 40),
            weekLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            weekLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            weekLabel.heightAnchor.constraint(equalToConstant: 35)
            
        ])
        NSLayoutConstraint.activate([
            ForecastTableView.topAnchor.constraint(equalTo: weekLabel.bottomAnchor, constant: 20),
            ForecastTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ForecastTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            ForecastTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 30)
            
        ])
    }
}
