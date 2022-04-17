//
//  StatisticViewController.swift
//  myProject
//
//  Created by olzhs on 10.04.2022.
//

import UIKit

class StatisticViewController: UIViewController {
    
    private let idExercisesTable = "idExercisesTable"
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.delaysContentTouches = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let labelStatistics = UILabel(text: "STATISTICS", font: .robotoBold24() ?? UIFont(), textColor: .specialBlack)
    
    private lazy var segmentedControlView: UISegmentedControl = {
        let items = ["Неделя", "Месяц"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentTintColor = .specialYellow
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .specialGreen
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        let font = .robotoMedium16() ?? UIFont()
        segmentedControl.setTitleTextAttributes([.foregroundColor : UIColor.white, .font : font], for: .normal)
        segmentedControl.setTitleTextAttributes([.foregroundColor : UIColor.specialGray, .font : font], for: .selected)
        segmentedControl.addTarget(self, action: #selector(segmentedControlChange), for: .valueChanged)
        
        return segmentedControl
    }()
    
    private let labelExercises = UILabel(text: "Exercises", font: .robotoMedium14() ?? UIFont(), textColor: .specialLightBrown)
    
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
        view.addSubview(labelExercises)
        
        tableView.register(StatisticsTableViewCell.self, forCellReuseIdentifier: idExercisesTable)
        view.addSubview(tableView)
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc private func segmentedControlChange() {
        if segmentedControlView.selectedSegmentIndex == 0 {
            print("Week")
        } else {
            print("Month")
        }

    }
    
}

//MARK: - UITableViewDelegate

extension StatisticViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
}

//MARK - UITableViewDataSource

extension StatisticViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idExercisesTable, for: indexPath) as? StatisticsTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    
}

//MARK: - SetConstraints

extension StatisticViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            labelStatistics.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            labelStatistics.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            segmentedControlView.topAnchor.constraint(equalTo: labelStatistics.bottomAnchor, constant: 30),
            segmentedControlView.heightAnchor.constraint(equalToConstant: 40),
            segmentedControlView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            segmentedControlView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
            
        ])
        
        NSLayoutConstraint.activate([
            labelExercises.topAnchor.constraint(equalTo: segmentedControlView.bottomAnchor, constant: 10),
            labelExercises.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: labelExercises.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
    }
}
