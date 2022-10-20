//
//  CustomTableViewCell.swift
//  List
//
//  Created by Сергей Бабич on 20.10.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupUI()
    }

    private let nameLabel: UILabel = .init()
    private let surnameLabel: UILabel = .init()
    private let email: UILabel = .init()
    private let imageView1: UIImageView = .init()

    func set(contact: Contact) {
        nameLabel.text = contact.name
        surnameLabel.text = contact.surname
        imageView1.image = UIImage(
            systemName: "person"
        )
    }

    private func setupUI() {
        nameLabel.font = .boldSystemFont(ofSize: 20)
        surnameLabel.font = .systemFont(ofSize: 14)
        let stackView = UIStackView(arrangedSubviews: [
            nameLabel, surnameLabel
        ])
        stackView.axis = .vertical
        stackView.alignment = .leading

        let imageStack = UIStackView(arrangedSubviews: [imageView1])

        contentView.addSubview(stackView)
        contentView.addSubview(imageStack)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageStack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageStack.widthAnchor.constraint(equalToConstant: 50),
            imageStack.heightAnchor.constraint(equalToConstant: 50),
            imageStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ])
    }
}
