//
//  DataManager.swift
//  List
//
//  Created by Сергей Бабич on 20.10.2022.
//

class DataManager {

    static let shared = DataManager()

    let names = [
        "Garry", "Lis", "Tom",
        "Grey", "Rose", "Ann",
        "Helen", "Jacson", "David",
        "John", "Carl", "Loki"
    ]

    let dict = [
        "name": "Jordan",
        "surname": "Less"
    ]

    let surnames = [
        "Linkoln", "Smith", "Barrelton",
        "Murphy", "Robertson", "Paddington",
        "Bells", "Padaleki", "Aclz",
        "Doren", "Buffet", "Colinz"
    ]

    let emails = [
        "solv@mail.ru", "bobret@mail.ru", "klaus@mail.ru",
        "mars02@mail.ru", "koki@mail.ru", "lolyt209@mail.ru",
        "backert@mail.ru", "solverbus007@mail.ru", "greets900@mail.ru",
        "rosetBuff89@mail.ru", "killerCat@mail.ru", "rolinsBuff466@mail.ru"
    ]

    private init() {}
}
