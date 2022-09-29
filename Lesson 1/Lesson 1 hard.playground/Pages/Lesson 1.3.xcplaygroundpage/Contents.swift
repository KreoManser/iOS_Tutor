//: [Previous](@previous)
import Foundation
//: ## Функции

/*:
 
    func nameOfFunction() {
        some code
    }
 
 */

/*
func addingTwoNumbers() {
    let a = 3
    let b = 2
    let c = a + b
    print(c)
}

let result = addingTwoNumber
addingTwoNumber()
result()
*/

//: ### Функции с возвращаемыми значениями

/*:
    func nameOfFunction() -> Data Type {
        some code
        return some value
    }
 
 */

func addingTwoNumbers() -> Int {
    let a = 3
    let b = 2
    return a + b
}

var result = addingTwoNumbers()
print(result)
//: ### Функции с параметрами

/*:
    func name(argumentOne parameterOne: Data Type, argumentTwo parameterTwo: Data Type) {
        some code
    }
 */

// Функция с параметрами без аргументов
func addingTwoNumbers(a: Int, b: Int) -> Int {
    a + b
}

addingTwoNumbers(a: 5, b: 8)

// Функция с параметрами и аргументами
func addingTwoNumbers(number a: Int, andNumber b: Int) -> Int {
    a + b
}

addingTwoNumbers(number: 7, andNumber: 4)

func addingTwoNumbers(_ a: Int, _ b: Int) -> Int {
    a + b
}

addingTwoNumbers(7, 9)

func addingTwoNumbers(_ a: Int, and b: Int) -> Int {
    a + b
}

addingTwoNumbers(4, and: 5)


//: ### Вариативные параметры

func arithmeticMean(_ numbers: Double...) -> Double {
    var total = 0.0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(2, 3, 3.14, 15, -9, 0.0)

//: ### Вложенные функции

let items = [0, 1, 2, 3, 4, 5, 6] // 7

func recursiveBinarySearch(by items: [Int], target: Int) -> Int? {
    func recursiveBinarySearch(by items: [Int], target: Int, firstIndex: Int, lastIndex: Int) -> Int? {
        if firstIndex > lastIndex {
            return nil
        }
        
        // Определяем элемент из середины коллекции
        let middleIndex = (firstIndex + lastIndex) / 2 // 3
        let item = items[middleIndex] // 3
        
        if item == target {
            return middleIndex // Элемент найден
        } else if target < item {
            //Поиск по левой половине коллекции
            return recursiveBinarySearch(
                by: items,
                target: target,
                firstIndex: firstIndex,
                lastIndex: middleIndex - 1
            )
        } else {
            // Поиск по правой половине коллекции
            return recursiveBinarySearch(
                by: items,
                target: target,
                firstIndex: middleIndex + 1,
                lastIndex: lastIndex
            )
        }
    }
    
    return recursiveBinarySearch(
        by: items,
        target: target,
        firstIndex: 0,
        lastIndex: items.count - 1
    )
}

recursiveBinarySearch(by: items, target: 1)

//: ### Функции как замыкания

//: Отбираем числа меньше заданного значения
let numbers = [5, 8, 20, 13, 1, 4, 3, 6]

func filterLessThanValue(value: Int, numbers: [Int]) -> [Int] {

    var filteredNumbers: [Int] = []

    for number in numbers {
        if number < value {
            filteredNumbers.append(number)
        }
    }
    return filteredNumbers
}

filterLessThanValue(value: 5, numbers: numbers)

//: Отбираем числа больше заданного значения
func filterGreaterThanValue(value: Int, numbers: [Int]) -> [Int] {

    var filteredNumbers: [Int] = []

    for number in numbers {
        if number > value {
            filteredNumbers.append(number)
        }
    }
    return filteredNumbers
}

filterGreaterThanValue(value: 5, numbers: numbers)

//: Функция для отбора чисел, относительно заданного значения


func filterWithPredicateClosure(value: Int, numbers: [Int], closure: (Int, Int) -> Bool) -> [Int] {
    var filterNumbers: [Int] = []

    for number in numbers {
        if closure(number, value) {
            filterNumbers.append(number)
        }
    }
    return filterNumbers
}


//: Функция для отбора числе меньше указанного значения

func lessThanValue(number: Int, value: Int) -> Bool {
    number < value
}

let resultTwo = lessThanValue(number: 5, value: 6) // вызов
let closure = lessThanValue // передача функции в новое свойство
filterWithPredicateClosure(value: 6, numbers: [324, 2, 5, 6, 8], closure: closure)
closure(3, 5)

//: Функция для отбора числе больше указанного значения

func greaterThanValue(number: Int, value: Int) -> Bool {
    number > value
}

//: Отбор чисел меньше указанного значения

filterWithPredicateClosure(value: 5, numbers: numbers, closure: lessThanValue)

//: Отбор чисел больше указанного значения

filterWithPredicateClosure(value: 5, numbers: numbers, closure: greaterThanValue)

//: ### Замыкающие выражения

/*:
 
 Замыкания бывают трех видов:
 
 - Глобальные функции — это замыканиями, у которых есть имя и которые не захватывают никакие значения.
 
 - Вложенные функции — это замыканиями, у которых тоже есть имя, но при этом они могут использовать или захватывать значения из родительской функции.
 
 - Замыкающие выражения - это безымянные функции, написанные в облегченном синтаксисе, которые могут захватывать значения из окружающего контекста
 
 */
func run() {
    func run2() {
        
    }
}

/*:
    { (параметры) -> тип результата in
        тело замыкающего выражения
    }
 */

//let closure: Int { someInt in
//    return 8
//}


//: Использование замыкания в качестве аргумента
//: Отбор чисел меньше указанного значения

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { (number: Int, value: Int) -> Bool in
        return number < value
    }
)

//: Отбор чисел больше указанного значения

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { (number: Int, value: Int) -> Bool in
        number > value
    }
)

//: Вывод типа из контекста

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { (number, value) in
        return number < value
    }
)

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { (number, value) in
        return number > value
    }
)

//: Неявные возвращаемые значения из замыканий с одним выражением

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { (number, value) in number < value }
)

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { (number, value) in number > value }
)


//: Сокращенные имена параметров

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { $0 < $1 }
)

filterWithPredicateClosure(
    value: 5,
    numbers: numbers,
    closure: { $0 > $1 }
)
//$0 = element
//$1 = element + 1
//for element in elements {
//
//}

//: Последующее замыкание

filterWithPredicateClosure(value: 5, numbers: numbers) { $0 < $1 }
filterWithPredicateClosure(value: 5, numbers: numbers) { $0 > $1 }

//: Операторные функции

filterWithPredicateClosure(value: 5, numbers: numbers, closure: <)
filterWithPredicateClosure(value: 5, numbers: numbers, closure: >)

//: Свойства с типом замыкающих выражений

let completion: (_ numberOne: Int, _ numberTwo: Int) -> Int = { $0 + $1 }

completion(7, 9)

var numberOne = 3
var numberTwo = 5

let closureT: () -> Int = { [numberOne, numberTwo] in
    numberOne + numberTwo
}
closureT()

numberOne = 6
numberTwo = 9

closureT()
//: [Next](@next)
