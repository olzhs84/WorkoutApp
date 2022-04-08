//
//  WeatherView.swift
//  myProject
//
//  Created by olzhs on 07.04.2022.
//

import Foundation
import UIKit

class WeatherView: UIView {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let sunImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "sun"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Солнечно"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let smallTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Хорошая погода, чтобы позаниматься на улице"
        label.numberOfLines = 3
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = #colorLiteral(red: 0.8044065833, green: 0.8044064641, blue: 0.8044064641, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
       
        addSubview(sunImage)
        addSubview(textLabel)
        addSubview(smallTextLabel)
    }
}

extension WeatherView {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            sunImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            sunImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            sunImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            sunImage.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            textLabel.bottomAnchor.constraint(equalTo: centerYAnchor),
            textLabel.trailingAnchor.constraint(equalTo: sunImage.leadingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            smallTextLabel.topAnchor.constraint(equalTo: centerYAnchor),
            smallTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            smallTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            smallTextLabel.trailingAnchor.constraint(equalTo: sunImage.leadingAnchor, constant: -10)
        ])
        
        
    }
    
}




