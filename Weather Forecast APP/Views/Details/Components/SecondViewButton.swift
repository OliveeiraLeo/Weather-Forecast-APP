//  SecondViewButton.swift
//  Weather Forecast APP
//  Created by Leonardo Oliveira on 15/02/24.

import UIKit
import Foundation
import ObjectiveC


class SecondViewButton: UIButton {
    
    var navigationController: UINavigationController?
    
    func setup2Button() {
        setImage(UIImage.backImage, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    @objc private func goBack() {
        print("Botão de voltar clicado!")
        navigationController?.popViewController(animated: true)
    }
    
    init() {
    super.init(frame: .zero)
        setup2Button()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
