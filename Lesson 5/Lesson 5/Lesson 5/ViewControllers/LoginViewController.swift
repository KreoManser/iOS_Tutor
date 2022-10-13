//
//  ViewController.swift
//  Lesson 5
//
//  Created by Сергей Бабич on 13.10.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var loginTF: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter your login"
        return textField
    }()

    private lazy var passwordTF: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter your password"
        textField.isSecureTextEntry = true
        return textField
    }()

    private lazy var logInButton: UIButton = {
        var attributes = AttributeContainer()
        attributes.font = UIFont.systemFont(ofSize: 15)

        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.attributedTitle = AttributedString("LogIn", attributes: attributes)
        buttonConfiguration.baseBackgroundColor = .systemOrange
        return UIButton(
            configuration: buttonConfiguration,
            primaryAction: UIAction { [unowned self] _ in
                guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondViewController else { return }
                secondVC.modalPresentationStyle = .fullScreen
                present(secondVC, animated: true)
// Если добавить NavController, то можно и пушить тут же
//                navigationController?.pushViewController(secondVC, animated: true)
            })
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setSubviews(loginTF, passwordTF, logInButton)
        setConstraint()
    }


// Здесь было про sender - это просто атрибут
//    private func someFunc(_ sender: Any) {
//        if text as? Int {
//            Int(text)
//        } else if text as? String {
//            text
//        }
//    }

    private func setSubviews(_ subview: UIView...) {
        subview.forEach { view.addSubview($0) }
    }

    private func setConstraint() {
        //        NSLayoutConstraint(item: loginTF, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 8, constant: 0)
        //        8*0 = 0 - в обычной математике
        //        8 * 0 = 1/8 - в нашем случае если константа = 1/8
        //        100 * 2 = 200 - в нашем случае если константа = 100
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20

        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        loginTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.translatesAutoresizingMaskIntoConstraints = false

        stackView.addArrangedSubview(loginTF)
        stackView.addArrangedSubview(passwordTF)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])

//      Авторесайзинг в стэк вью - можете разкоментить - посмотреть
//        NSLayoutConstraint.activate([
//            loginTF.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0),
//            loginTF.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10),
//            loginTF.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10)
//        ])

        logInButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
    }


}

