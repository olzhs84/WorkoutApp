//
//  StatisticsTableViewCell.swift
//  myProject
//
//  Created by olzhs on 11.04.2022.
//

import UIKit

class StatisticsTableViewCell: UITableViewCell {
    
    private let bigLabel = UILabel(text: "Biceps", font: .robotoMedium24() ?? UIFont(), textColor: .specialBlack)
    private let stackBeforeLabel = UILabel(text: "Before:10", font: .robotoMedium16() ?? UIFont(), textColor: .specialLightBrown)
    private let stackNowLabel = UILabel(text: "Now: 1010", font: .robotoMedium16() ?? UIFont(), textColor: .specialLightBrown)
    
    
    private let lineView: UIView = {
       let view = UIView()
        view.backgroundColor = .specialLightBrown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var stackTableView = UIStackView()
    
    private let countProgressLabel: UILabel = {
        let label = UILabel()
        label.text = "+1000"
        label.textColor = .specialGreen
        label.font = .robotoMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(countProgressLabel)
        addSubview(bigLabel)
        
        stackTableView = UIStackView(arrangedSubviews: [stackBeforeLabel, stackNowLabel], axis: .horizontal, spacing: 10)
        addSubview(stackTableView)
        addSubview(lineView)
        
    
    }
    
}

//MARK - SetConstrains

extension StatisticsTableViewCell {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            bigLabel.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            bigLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            bigLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            stackTableView.topAnchor.constraint(equalTo: bigLabel.bottomAnchor, constant: 2),
            stackTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackTableView.widthAnchor.constraint(equalToConstant: 180)
        ])
        
        NSLayoutConstraint.activate([
            countProgressLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            countProgressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            stackTableView.topAnchor.constraint(equalTo: bigLabel.bottomAnchor, constant: 10),
            stackTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
    }
}
