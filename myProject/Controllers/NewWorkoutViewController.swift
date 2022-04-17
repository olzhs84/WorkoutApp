//
//  NewWorkoutViewController.swift
//  myProject
//
//  Created by olzhs on 13.04.2022.
//

import UIKit

class NewWorkoutViewController: UIViewController {
    
    private let newWorkoutLabel = UILabel(text: "NEW WORKOUT", font: .robotoMedium24() ?? UIFont(),
                                                textColor: .specialGray)
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let nameLabel = UILabel(text: "Name", font: .robotoMedium14() ?? UIFont(), textColor: .specialLightBrown)
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .specialBrown
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .specialGray
        textField.font = .robotoBold20()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 15,
                                                  height: textField.frame.height))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        return textField
    }()
    
    private let dateAndRepeatLabel = UILabel(text: "Date and  repeat", font: .robotoMedium14() ?? UIFont(),
                                             textColor: .specialLightBrown)
    
    private let dateAndRepeatView = DateAndRepeatView()
    private let repsTimerLabel = UILabel(text: "Reps or timer", font: .robotoMedium14() ?? UIFont(),
                                         textColor: .specialLightBrown)
    private let repsOrTimerView = RepsOrTimerView()
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .specialGreen
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .robotoMedium22()
        button.setTitle("SAVE", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    private let datePicker: UIDatePicker = {
//       let datePicker = UIDatePicker()
//        datePicker.datePickerMode = .date
//        datePicker.tintColor = .specialGreen
//
//        datePicker.translatesAutoresizingMaskIntoConstraints = false
//        return datePicker
//    }()
//
//    private let testSwitch: UISwitch = {
//       let testSwitch = UISwitch()
//        testSwitch.isOn = true
//        testSwitch.onTintColor = .specialGreen
//        testSwitch.translatesAutoresizingMaskIntoConstraints = false
//        return testSwitch
//    }()
//
//    private lazy var slider: UISlider = {
//       let slider = UISlider()
//        slider.minimumValue = 0
//        slider.maximumValue = 10
//        slider.minimumTrackTintColor = .specialGreen
//        slider.maximumTrackTintColor = .specialLightBrown
//        slider.translatesAutoresizingMaskIntoConstraints = false
//        slider.addTarget(self, action: #selector(changeValueSlider), for: .touchUpInside)
//        return slider
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
//        datePicker.subviews[0].subviews[0].subviews[0].alpha = 0
    }
    
    override func viewDidLayoutSubviews() {
        closeButton.layer.cornerRadius = closeButton.frame.width / 2
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(newWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(dateAndRepeatLabel)
        view.addSubview(dateAndRepeatView)
        view.addSubview(repsTimerLabel)
        view.addSubview(repsOrTimerView)
        view.addSubview(saveButton)
//        view.addSubview(datePicker)
//        view.addSubview(testSwitch)
//        view.addSubview(slider)
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
//    @objc private func changeValueSlider() {
//        print(slider.value)
//    }
    
    @objc private func saveButtonTapped() {
        print("SAVE")
    }
}

//MARK - SetConstraints

extension NewWorkoutViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 38)
        ])
        
        NSLayoutConstraint.activate([
            dateAndRepeatLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            dateAndRepeatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            dateAndRepeatView.topAnchor.constraint(equalTo: dateAndRepeatLabel.bottomAnchor, constant: 0),
            dateAndRepeatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateAndRepeatView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateAndRepeatView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            repsTimerLabel.topAnchor.constraint(equalTo: dateAndRepeatView.bottomAnchor, constant: 10),
            repsTimerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            repsOrTimerView.topAnchor.constraint(equalTo: repsTimerLabel.bottomAnchor, constant: 0),
            repsOrTimerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            repsOrTimerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            repsOrTimerView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: repsOrTimerView.bottomAnchor, constant: 15),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
        ])
        
//        NSLayoutConstraint.activate([
//            datePicker.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
//            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//
//        ])
//
//        NSLayoutConstraint.activate([
//            testSwitch.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
//            testSwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//
//        ])
//
//        NSLayoutConstraint.activate([
//            slider.topAnchor.constraint(equalTo: testSwitch.bottomAnchor, constant: 20),
//            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
//        ])
    }
}
