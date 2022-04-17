//
//  DateAndRepeatView.swift
//  myProject
//
//  Created by olzhs on 15.04.2022.
//

import UIKit

class DateAndRepeatView: UIView {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupViews()
        setConstraints()
        
        datePickerLabel.subviews[0].subviews[0].subviews[0].alpha = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let dateLabel = UILabel(text: "Date", font: .robotoMedium16() ?? UIFont(), textColor: .specialBlack)
    
    var dateRepeatStack = UIStackView()
    
    private let datePickerLabel: UIDatePicker = {
       let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.tintColor = .specialGreen
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private let repeatLabel = UILabel(text: "Repeat every 7 days", font: .robotoMedium16() ?? UIFont(), textColor: .specialBlack)
    
    private let switchLabel: UISwitch = {
        let switchlabel = UISwitch()
        switchlabel.isOn = true
        switchlabel.onTintColor = .specialGreen
        switchlabel.translatesAutoresizingMaskIntoConstraints = false
        return switchlabel
    }()
    
    var repeatStack = UIStackView()
    
    private func setupViews() {
        backgroundColor = .specialBrown
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        
        dateRepeatStack = UIStackView(arrangedSubviews: [dateLabel, datePickerLabel], axis: .horizontal, spacing: 0)
        dateRepeatStack.distribution = .equalSpacing
        addSubview(dateRepeatStack)
        
        repeatStack = UIStackView(arrangedSubviews: [repeatLabel, switchLabel], axis: .horizontal, spacing: 0)
        addSubview(repeatStack)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            dateRepeatStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            dateRepeatStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            dateRepeatStack.topAnchor.constraint(equalTo: topAnchor, constant: 13)
        ])
        
        NSLayoutConstraint.activate([
            repeatStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            repeatStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            repeatStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -13)
        ])
        
    }
    
}
