//
//  Contact.swift
//  List
//
//  Created by Сергей Бабич on 20.10.2022.
//

struct Contact {
    let name: String
    let surname: String
    let email: String
}

extension Contact {
    static func getContactList() -> [Contact] {
        var contacts: [Contact] = []
        let names = DataManager.shared.names.shuffled()
        let surnames = DataManager.shared.surnames.shuffled()
        let emails = DataManager.shared.emails.shuffled()

        let iterationCount = min(
            names.count,
            surnames.count,
            emails.count
        )

        for index in 0..<iterationCount {
            let contact = Contact(
                name: names[index],
                surname: surnames[index],
                email: emails[index]
            )

            contacts.append(contact)
        }

        return contacts
    }
}
