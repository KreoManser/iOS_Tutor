//: [Previous](@previous)

import UIKit

//: ## Кортежи

/*:
 
    (valueOne, ValueTwo, ValueThree,…)

*/

class Weather {
    var currentWeather: (Int, String)
    
    init(currentWeather: (Int, String)) {
        self.currentWeather = currentWeather
    }
}

let weather = Weather(currentWeather: (22, "Sunny"))
weather.currentWeather

//: ### Получение доступа к элементам

weather.currentWeather.0 = 24
weather.currentWeather.1 = "Rainy"

let (temperature, _) = weather.currentWeather
temperature
//atmos

//: ### Именование элементов кортежа

let currentWeather = (temp: 21, atmos: "Fog", windSpeed: 6)
currentWeather.temp
currentWeather.atmos
currentWeather.windSpeed

//: ### Массовое присвоение значений

var numberOne = 1
var numberTwo = 2
var numberThree = 3

(numberOne, numberTwo, numberThree) = (4, 5, 6)

var cityTemp = [
    "Moscow": Int.random(in: 10...25),
    "St. Petersburg": Int.random(in: 10...20),
    "Ufa": Int.random(in: 15...25)
]

for (city, temp) in cityTemp {
    print("Температура в городе \(city) составляет \(temp) градусов")
}

let cityList = cityTemp.sorted(by: <)

for cityTemp in cityList {
    print("Температура в городе \(cityTemp.key) составляет \(cityTemp.value) градусов")
}

func getTemp(in city: String) -> (city: String, temp: Int) {
    let temp = Int.random(in: 15...25)
    return (city, temp)
}

let (city, temp) = getTemp(in: "Ufa")
print("Температура в городе \(city) составляет \(temp) градусов")

let tempInCity = getTemp(in: "Moscow")
print("Температура в городе \(tempInCity.city) составляет \(tempInCity.temp) градусов")

//: ## Опциональные типы

var someString = ""
let anotherString: String
var optionalString: String? = ""

//someString = optionalString

let possibleNumber = "12345d"
var convertedNumber = Int(possibleNumber)

//: ### Извлечение опционалов

convertedNumber = 16


//: ### Принудительное извлечение опционалов

if convertedNumber != nil {
    convertedNumber = nil
    print("convertedNumber has an integer value of \(convertedNumber ?? 0)")
}

//: ### Привязка опционалов

if let convertedNumber = convertedNumber {
    print("convertedNumber has an integer value of \(convertedNumber)")
} else {
    print("convertedNumber does not contains some integer value")
}


//: ### Guard

func doSomething() {
    guard let convertedNumber = convertedNumber else { return }
    print("convertedNumber has an integer value of \(convertedNumber)")
}

var name = ""
var surname = ""
var email = ""
var age = 0

func createNewUserV1(name: String, surname: String, email: String, age: Int) {
    if !name.isEmpty {
        print(name)
    } else {
        print("Enter your name")
    }
    
    if !surname.isEmpty {
        print(surname)
    } else {
        print("Enter your surname")
    }
    
    if !email.isEmpty {
        print(email)
    } else {
        print("Enter your email")
    }
    
    if age >= 18 {
        print(age)
    } else {
        print("Entry for adults only")
    }
    
    print("\(name) \(surname), Welcome!")
}

//createNewUserV1(name: name, surname: surname, email: email, age: age)
name = "Tim"
surname = "Cook"
email = "timcook@apple.com"
age = 18

func createNewUserV2(name: String, surname: String, email: String, age: Int) {
    if !name.isEmpty {
        print(name)
        if !surname.isEmpty {
            print(surname)
            if !email.isEmpty {
                print(email)
                if age >= 18 {
                    print("\(name) \(surname), Welcome!")
                } else {
                    print("Entry for adults only")
                }
            } else {
                print("Enter your email")
            }
        } else {
            print("Enter your surname")
        }
    } else {
        print("Enter your name")
    }
}

//createNewUserV2(name: name, surname: surname, email: email, age: age)

func createNewUserV3(name: String, surname: String, email: String, age: Int) {
    if name.isEmpty {
        print("Enter your name")
        return
    }
    
    print(name)
    
    if surname.isEmpty {
        print("Enter your surname")
        return
    }
    
    print(surname)
    
    if email.isEmpty {
        print("Enter your email")
        return
    }
    
    print(email)
    
    if age < 18 {
        print("Entry for adults only")
        return
    }
    
    print("\(name) \(surname), Welcome!")
}

//age = 16
//surname = ""

//createNewUserV3(name: name, surname: surname, email: email, age: age)

func createNewUserV4(name: String?, surname: String?, email: String?, age: Int?) {
    if name == nil, name?.count == 0 {
        print("Enter your name")
        return
    }
    
    print(name!)
    
    if surname == nil, surname?.count == 0  {
        print("Enter your surname")
        return
    }
    
    print(surname!)
    
    if email == nil, email?.count == 0  {
        print("Enter your email")
        return
    }
    
    print(email!)
    
    if age == nil, age! < 18  {
        print("Entry for adults only")
        return
    }
    
    print("\(name!) \(surname!), Welcome!")
}

//: ### Синтаксис

/*:

    guard condition else { return }

 */

func createNewUserV5(name: String?, surname: String?, email: String?, age: Int?) {
    guard let name = name, !name.isEmpty else { return }
    guard let surname = surname, !surname.isEmpty else { return }
    guard let email = email, !email.isEmpty else { return }
    guard let age = age, age >= 18 else {
        print("Entry for adults only")
        return
    }
    
    print("\(name) \(surname), Welcome!")
}

//: ### Неявно извлеченные опционалы

struct User {
    let name: String
    let surname: String
    let phone: String
    let email: String
}

class UserProfileViewModel {
    var userNameLabel = ""
    var userSurnameLabel = ""
    var userPhoneLabel = ""
    var userEmailLabel = ""
    var user: User!
    
    func setupUI() {
        userNameLabel = user.name
        userSurnameLabel = user.surname
        userEmailLabel = user.email
        userPhoneLabel = user.phone
    }
}

let user = User(
    name: "Tim",
    surname: "Cook",
    phone: "888-88-77",
    email: "timcook@apple.com"
)

let userProfile = UserProfileViewModel()
userProfile.user = user
userProfile.setupUI()

//: ## Опциональная последовательность

class Person {
    var id: String?
    var residence: Residence?
}

class Residence {
    var address: Address?
}

class Address {
    var buildingNumber: String?
    var streetName: String?
    var apartmentNumber: String?
}

var person: Person?

if let residence = person?.residence {
    if let address = residence.address {
        if let apartmentNumber = address.apartmentNumber {
            print("The apartment number: \(apartmentNumber)")
        }
    }
}

if let apartmentNumber = person?.residence?.address?.apartmentNumber {
    print("The apartment number: \(apartmentNumber)")
}


//: [Next](@next)
