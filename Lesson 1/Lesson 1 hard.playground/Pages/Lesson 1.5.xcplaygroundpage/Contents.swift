//: [Previous](@previous)

import UIKit

//: ## Перечисления

var someDay = "Monday"

func setupAlarm(for day: String) {
    if day == "Monday" || day == "Tuesday" {
        print("Today is \(day). The alarm is set an 8 am")
    } else {
        print("Today is \(day). Alarm not set")
    }
}

setupAlarm(for: someDay)

someDay = "tuesday"

setupAlarm(for: someDay)

/*:
    enum EnumerationName {
        case enumeration
    }
 
 */

enum Weekday {
    case monday
    case tuesday
    case wednsday
    case thursday
    case friday
    case saturday
    case sunday
}

var weekday = Weekday.thursday
var weekday2: Weekday = .friday

//: ### Использование инструкции Switch

func setupAlarm(for weekday: Weekday) {
    switch weekday {
    case .monday, .tuesday:
        print("Set alarm for 8 am")
    case .wednsday:
        print("Set alarm for 7 am")
    case .thursday:
        print("Set alarm for 8:15 am")
    case .friday:
        print("Yay! TGIF!")
    default:
        print("Weekend. Alarm not set")
    }
}

setupAlarm(for: weekday)

weekday = .monday

setupAlarm(for: weekday)

//: ### Исходные значения

enum Country: String {
    case usa = "USA"
    case russia = "Russia"
    case china
}

var country = Country.usa
print("case name: \(country)")
print("case value: \(country.rawValue)")

country = .china
print("case name: \(country)")
print("case value: \(country.rawValue)")

enum Planet: Int {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let planet = Planet.earth
print("\(planet) is the \(planet.rawValue) planet from the sun")

//: ### Инициализация

let possiblePlanet = Planet(rawValue: 4)

//: ### Связанные значения (ассоциированные параметры)

enum WeekdayV2 {
    case workday(message: String, time: Int)
    case weekend(message: String)
}

var day = WeekdayV2.workday(message: "Set alarm to", time: 8)

func setupAlarm(for weekday: WeekdayV2) {
    switch weekday {
    case let .workday(message, time):
        print("\(message) \(time)")
    case let .weekend(message):
        print(message)
    }
}

setupAlarm(for: day)

day = .weekend(message: "Weekend. Alarm not set")

setupAlarm(for: day)


//: [Next](@next)
