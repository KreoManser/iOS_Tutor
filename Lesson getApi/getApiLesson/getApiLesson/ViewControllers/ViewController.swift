//
//  ViewController.swift
//  getApiLesson
//
//  Created by Сергей Бабич on 17.11.2022.
//

import UIKit

class ViewController: UIViewController {
    private lazy var infoTableView = UITableView(frame: .zero, style: .insetGrouped)

    var data: [Data] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(infoTableView)
        infoTableView.dataSource = self
        setConstraints()
        fetchData()
        infoTableView.register(UITableViewCell.self, forCellReuseIdentifier: ide.mainCell.rawValue)
    }

    private func fetchData() {
        Task {
            do {
                data = try await NetworkManager.shared.getUserData()
                infoTableView.reloadData()
            } catch {
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    enum ide: String {
        case mainCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            default:
                let cell = UITableViewCell(style: .value2, reuseIdentifier: ide.mainCell.rawValue)
                var configuration = UIListContentConfiguration.cell()
                let name = data[indexPath.row].firstName
                let email = data[indexPath.row].email

                let imageURL = data[indexPath.row].avatar

                switch indexPath.row {
                    default:
                        configuration.imageProperties.maximumSize = CGSize(width: 25, height: 25)
                        
                        configuration.text = name
                        configuration.secondaryText = email
                }
                cell.contentConfiguration = configuration

                return cell
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        10
    }
}

extension ViewController {
    private func setConstraints() {
        infoTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            infoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            infoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
