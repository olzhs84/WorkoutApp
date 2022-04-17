//
//  RepsOrTimerView.swift
//  myProject
//
//  Created by olzhs on 16.04.2022.
//

import UIKit

class RepsOrTimerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let setsLabel = UILabel(text: "Sets", font: .robotoMedium18()
                                    ?? UIFont(), textColor: .specialBlack)
    private let setsCountLabel = UILabel(text: "0", font: .robotoMedium24()
                                         ?? UIFont(), textColor: .specialBlack)
    var stackSetsLabel = UIStackView()
    
    private let chooseLabel = UILabel(text: "Choose repeat or timer",
                                      font: .robotoMedium14() ?? UIFont(),
                                      textColor: .specialLightBrown)
    private let repsLabel = UILabel(text: "Reps", font:
            .robotoMedium18() ?? UIFont(), textColor: .specialBlack)
    private let repsCountLabel = UILabel(text: "0", font: .robotoMedium24() ?? UIFont(), textColor: .specialBlack)
    var stackRepsLabel = UIStackView()
    
    private let timerLabel = UILabel(text: "Timer", font: .robotoMedium18() ?? UIFont(), textColor: .specialBlack)
    private let timerCountLabel = UILabel(text: "0 min", font: .robotoMedium24() ?? UIFont(), textColor: .specialBlack)
    var timerStackLabel = UIStackView()
    
    private lazy var setsSlider: UISlider = {
       let slider = UISlider()
        slider.maximumTrackTintColor = .specialLightBrown
        slider.minimumTrackTintColor = .specialGreen
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(setsSliderAction),
                         for: .valueChanged)
        return slider
    }()
    private lazy var repsSlider: UISlider = {
       let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 20
        slider.minimumTrackTintColor = .specialGreen
        slider.maximumTrackTintColor = .specialLightBrown
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(repsSliderAction), for: .valueChanged)
        return slider
    }()
    private lazy var timerSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 360
        slider.minimumTrackTintColor = .specialGreen
        slider.maximumTrackTintColor = .specialLightBrown
        slider.addTarget(self, action: #selector(timerSliderAction), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private func setupViews() {
        backgroundColor = .specialBrown
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        stackSetsLabel = UIStackView(arrangedSubviews: [
            setsLabel, setsCountLabel], axis: .horizontal, spacing: 0)
        stackSetsLabel.distribution = .equalSpacing
        addSubview(stackSetsLabel)
        addSubview(setsSlider)
        addSubview(chooseLabel)
        
        stackRepsLabel = UIStackView(arrangedSubviews: [repsLabel, repsCountLabel], axis: .horizontal, spacing: 0)
        stackRepsLabel.distribution = .equalSpacing
        addSubview(stackRepsLabel)
        addSubview(repsSlider)
        
        timerStackLabel = UIStackView(arrangedSubviews: [timerLabel, timerCountLabel], axis: .horizontal,
                                      spacing: 0)
        timerStackLabel.distribution = .equalSpacing
        addSubview(timerStackLabel)
        addSubview(timerSlider)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            stackSetsLabel.topAnchor.constraint(equalTo: topAnchor,
                                                constant: 15),
            stackSetsLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                    constant: 15),
            stackSetsLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                     constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            setsSlider.topAnchor.constraint(
                equalTo: stackSetsLabel.bottomAnchor, constant: 0),
            setsSlider.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: 15),
            setsSlider.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            chooseLabel.topAnchor.constraint(equalTo: setsSlider.bottomAnchor,
                                             constant: 10),
            chooseLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackRepsLabel.topAnchor.constraint(equalTo: chooseLabel.bottomAnchor, constant: 10),
            stackRepsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackRepsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            repsSlider.topAnchor.constraint(equalTo: stackRepsLabel.bottomAnchor, constant: 0),
            repsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            timerStackLabel.topAnchor.constraint(equalTo: repsSlider.bottomAnchor, constant: 10),
            timerStackLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            timerStackLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            timerSlider.topAnchor.constraint(equalTo: timerStackLabel.bottomAnchor, constant: 0),
            timerSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            timerSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
    
    @objc private func setsSliderAction() {
        setsCountLabel.text = "\(Int(setsSlider.value))"
    }
    
    @objc private func repsSliderAction() {
        repsCountLabel.text = "\(Int(repsSlider.value))"
        setNegative(label: timerLabel, countLabel: timerCountLabel, slider: timerSlider)
        setActive(label: repsLabel, countLabel: repsCountLabel, slider: repsSlider)
    }
    
    @objc private func timerSliderAction() {
        
        let (min, sec) = { (mins: Int) -> (Int, Int) in
            return (mins / 60, mins % 60)
        }(Int(timerSlider.value))
        
        timerCountLabel.text = (sec != 0 ? "\(min) min  \(sec) sec" : "\(min) min")
        setNegative(label: repsLabel, countLabel: repsCountLabel, slider: repsSlider)
        setActive(label: timerLabel, countLabel: timerCountLabel, slider: timerSlider)
    }
    
    private func setNegative(label: UILabel, countLabel:UILabel, slider: UISlider) {
        label.alpha = 0.5
        countLabel.alpha = 0.5
        slider.alpha = 0.5
        countLabel.text = "0"
        slider.value = 0
    }
    
    private func setActive(label: UILabel, countLabel:UILabel, slider: UISlider) {
        label.alpha = 1
        countLabel.alpha = 1
        slider.alpha = 1
    }
}
