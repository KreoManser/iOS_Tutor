import UIKit
//: ## Базовые операторы

//: ### Арифметические операторы:

var a = 9
var b = 4

a + b
a - b
a * b
a / b

//: ### Оператор остатка от деления:

a % b
-a % b
a % -b

//: ### Оператор присваивания:

a = 5
b = 10
let c = a + b

print("a equal \(a)")
print("b equal \(b)")
print("c equal \(c)")

a += b // a = a + b // a = 5 + 10 // 15
a -= b // a = a - b // a = 15 - 10 // 5
a *= b // a = a * b // a = 5 * 10 // 50
a /= b // a = a / b // a = 50 / 10 // 5


//: ### Операторы сравнения:

a == b // false
a != b // true
a > b // false
a < b // true
a >= b // false
a <= b // true

//: ### Оператор логического НЕ:

let accessDeniedMessage = "ACCESS DENIED"
let welcomeMessage = "Welcome!"

var allowedEntry = false // Разрешение на вход отсутствует

if !allowedEntry {
    print(accessDeniedMessage)
} else {
    print(welcomeMessage)
}

//: ### Оператор логического И:

let enteredDoorCode = true
let passedRetinaScan = false

if enteredDoorCode && passedRetinaScan {
    allowedEntry = true
}

if !allowedEntry {
    print(accessDeniedMessage)
} else {
    print(welcomeMessage)
}

//: ### Оператор логического ИЛИ:

let hasDoorKey = false
let knowsOverridePassword = true

if hasDoorKey || knowsOverridePassword {
    allowedEntry = true
}

if !allowedEntry {
    print(accessDeniedMessage)
} else {
    print(welcomeMessage)
}

if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    allowedEntry = true
}

if !allowedEntry {
    print(accessDeniedMessage)
} else {
    print(welcomeMessage)
}

//: ## Работа со строками:
//: ### Объявление и инициализация строк

let name = "Tim"
let surname = "Cook"
var fullName: String
//has no initializer
let yearOfBirth = 1960
let currentYear = 2022

//: ### Многострочные литералы

var resume = """
    Full name: Tim Cook
    Year of birth: 1960
    Age: 61
    Company: Apple inc
    Post: CEO
    Quotes: "You are more powerful then you thin"
    """

print(resume)

//: ### Конкатенация строк:

fullName = name + " " + surname
var greeting = "Hello, my name is "

greeting += fullName

//: ### Интерполяция строк

resume = """
    Full name: \(fullName)
    Year of birth: \(yearOfBirth)
    Age: \(currentYear - yearOfBirth)
    Company: Apple inc
    Post: CEO
    Quotes: "You are more powerful then you thin"
    """

print("\n\(resume)")


//: [Next](@next)
