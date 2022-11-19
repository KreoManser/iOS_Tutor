//
//  User.swift
//  getApiLesson
//
//  Created by Сергей Бабич on 17.11.2022.
//

import Foundation

struct User: Codable {
    let data: [Data]
}

struct Data: Codable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
}
