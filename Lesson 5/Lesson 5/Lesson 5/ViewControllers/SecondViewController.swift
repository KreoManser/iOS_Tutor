//
//  SecondViewController.swift
//  Lesson 5
//
//  Created by Сергей Бабич on 13.10.2022.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var buttonT: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setConstraint()
    }

    private func setConstraint() {
        buttonT.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            buttonT.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            buttonT.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            buttonT.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100)
        ])
    }
}
