//  Constraints+Extensions.swift
//  Weather Forecast APP
//  Created by Leonardo Oliveira on 11/02/24.

import UIKit
import Foundation

extension UIView {
    
func setConstraintsToParent(_ parent: UIView) {
    NSLayoutConstraint.activate([
        self.topAnchor.constraint(equalTo: parent.topAnchor),
        self.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
        self.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
        self.bottomAnchor.constraint(equalTo: parent.bottomAnchor)
            
    ])
  }
}
