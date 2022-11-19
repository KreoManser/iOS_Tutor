//
//  NetworkManager.swift
//  getApiLesson
//
//  Created by Сергей Бабич on 17.11.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
}

enum Links: String {
    case reqres = "https://reqres.in/api/users"
}

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func getUserData() async throws -> [Data] {
        guard let url = URL(string: Links.reqres.rawValue) else {
            throw NetworkError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let user = try decoder.decode(User.self, from: data)
        return user.data
    }

    func getImage(_ url: String) async throws -> Void {
        
    }
}
