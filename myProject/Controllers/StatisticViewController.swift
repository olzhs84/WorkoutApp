//
//  StatisticViewController.swift
//  myProject
//
//  Created by olzhs on 10.04.2022.
//

import UIKit

class StatisticViewController: UIViewController {
    
    private let labelStatistics: UILabel = {
       let label = UILabel()
        label.text = "STATISTICS"
        label.font = .robotoBold24()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let segmentedControlView: UISegmentedControl = {
        let items = ["Неделя", "Месяц"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentTintColor = .specialYellow
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .specialGreen
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let titleTextAttributes2 = [NSAttributedString.Key.foregroundColor: UIColor.black]
        segmentedControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
        segmentedControl.setTitleTextAttributes(titleTextAttributes2, for: .selected)
        
        return segmentedControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setDelegate()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(labelStatistics)
        view.addSubview(segmentedControlView)
    }
    
    private func setDelegate() {
        
    }
    
    
}

extension StatisticViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            labelStatistics.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            labelStatistics.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            segmentedControlView.topAnchor.constraint(equalTo: labelStatistics.bottomAnchor, constant: 30),
            segmentedControlView.heightAnchor.constraint(equalToConstant: 40),
            segmentedControlView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            segmentedControlView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
            
        ])
        
    }
}
