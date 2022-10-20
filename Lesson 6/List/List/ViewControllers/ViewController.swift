//
//  ViewController.swift
//  List
//
//  Created by Сергей Бабич on 20.10.2022.
//

import UIKit

class ViewController: UIViewController {

    private let tableView: UITableView = .init()
    private let contacts = Contact.getContactList()
//    Example
//    let d = DataManager.shared.dict

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        tableView.register(
            CustomTableViewCell.self,
            forCellReuseIdentifier: CellIdentifier.sectOne.rawValue
        )
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setupUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "List"
        setSubviews(tableView)
        setConstraint()
        print(contacts)
    }

    private func setSubviews(_ subviews: UIView...) {
        subviews.forEach { view.addSubview($0) }
    }

    private func setConstraint() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    enum CellIdentifier: String {
        case sectOne
        case sectTwo
    }

///    DEFAULT CELL
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.sectOne.rawValue) else { return UITableViewCell() }
//        let contact = contacts[indexPath.section]
///                      cell() - это вид ячейки - их куча, смотрите в документации!
//        var content = UIListContentConfiguration.cell()
//
//        switch indexPath.row {
//            case 0:
//                content.text = contact.surname
//                content.image = UIImage(systemName: "person")
//            default:
//                content.text = contact.email
//                content.image = UIImage(systemName: "phone")
//        }
//
//        cell.contentConfiguration = content
//
////        cell.selectionStyle = .none
//        return cell
//    }

///    CUSTOM CELL
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.sectOne.rawValue) as? CustomTableViewCell else { fatalError("Error") }

        let contact = contacts[indexPath.section]
        cell.set(contact: contact)

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        contacts.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        contacts[section].name
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        90
//    }
}
