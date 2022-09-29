//: [Previous](@previous)

import Foundation

//: ## Словари
//: > Неупорядоченные коллекции, которые хранят в себе пары «ключ-значение». Тип ключа словаря может отличаться от типа значения. При этом сами ключи и значения должны быть одного типа

var someStringDictionary = Dictionary<String, String>() //Полная форма записи словаря
var morStringDictionary: Dictionary<String, String> = [:]
var anotherSomeDictionary = [Int: String]() // Сокращенная форма записи словаря
var carWashQueue: [String: String] = [:]  // Рекомендованная форма записи

// Наполнение словаря данными
carWashQueue = ["E986BA": "Red Toyota", "X127MT": "White BMW X6"]

// Изменение значения для ключа
carWashQueue["E986BA"] = "Red Camry"
carWashQueue

// Изменение значения с сохранением старого значения
let oldValue = carWashQueue.updateValue("Grey BMW X6", forKey: "X127MT")

// Добавление новой пары ключ-значение
carWashQueue["M566PA"] = "Green Chevrolet Niva"
carWashQueue

// Удаление значения по ключу с сохранением значения
carWashQueue.removeValue(forKey: "X127MT")
carWashQueue["M566PA"] = nil
carWashQueue

carWashQueue.count

carWashQueue.removeAll()

//: ## Работа с символами

let string = String(["H", "e", "l", "l", "o"])
print(string)

string.count
string.isEmpty

//: ## For-in циклы

/*:
 
    for counter in lower…upper {
        some code
    }
 
 */

var sum = 0

for counter in 1...5 {
    sum += counter
}

print(sum)

//: ### Итерация по массиву

let fruits = [
    "apple",
    "banana",
    "pineapple",
    "apple",
    "pear",
    "apple",
    "plum",
    "apricot",
    "apple"
]

var appleCount = 0

for fruit in fruits {
    if fruit == "apple" {
        appleCount += 1
    }
}

for (index, fruit) in fruits.enumerated() {
    print(index, fruit)
}

print("The number of apples is \(appleCount) pieces")

//: ### Итерация по словарю

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]

for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

//: ### Итерация по тексту

let greeting = "Hello!"

for char in greeting {
    print(char)
}

//: ## While циклы

/*:
 
    while condition {
        some code
    }
 
 */

var counter = 5

while counter > 0 {
    print(counter)
    counter -= 1
}


/*:
 
    repeat {
        some code
    } while condition
 
 */

counter

repeat {
    print(counter)
    counter -= 1
} while counter > 0
//: [Next](@next)
