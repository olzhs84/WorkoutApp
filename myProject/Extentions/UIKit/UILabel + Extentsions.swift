//
//  UILabel + Extentsions.swift
//  myProject
//
//  Created by olzhs on 13.04.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String = "", font: UIFont, textColor: UIColor) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
