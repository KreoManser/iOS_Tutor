//: [Previous](@previous)

import UIKit

//: ## Массивы
//: > Хранят в себе упорядоченные, но при этом не уникальные значения одного типа

// Неизменяемый массив с типом данных String
let strings = ["a", "b", "c"]

// Неизменяемый массив с типом данных Character
let characters: [Character] = ["a", "b", "c"]

// Пустой массив с типом Int
var integers = [Int]()
var anotherIntegers: [Int] = [23] // Рекомендованный способ

// Присваивание данных массиву
integers = [1, 2, 3]

// Теперь наш массив имеет другие данные
integers = [4, 5, 6]

// Добавление новых значений к уже существующим
integers += [7, 8]

// Добавление нового значения при помощи метода append
integers.append(9)
integers.append(contentsOf: anotherIntegers)

// Добавление нового элемента по индексу
integers.insert(1, at: 0)

let someIntegers = [12, 17]

// Создание нового массива, путём объединения двух других массивов
anotherIntegers = integers + someIntegers

//Удаление последнего элемента из массива
anotherIntegers.removeLast()

//Удаление последнего элемента из массива и сохранение его в константе
let lastValueFromArray = anotherIntegers.removeLast()

//Результат после удаления последнего элемента
anotherIntegers

//Удаление первого элемента из массива и сохранение его в константе
let firstValueFromArray = anotherIntegers.removeFirst()

// Результат после удаления первого элемента
anotherIntegers

// Удаление значения по индексу
anotherIntegers.remove(at: 1)

// Результат после удаления значение по индексу
anotherIntegers

// Количество элементов массива
anotherIntegers.count

// Удаление всех элементов массива
anotherIntegers.removeAll()

// Обнуление массива путём присваивания ему пустого массиву
integers = []
integers = [10, 20, 40]

// Замена значения по индексу 2 на новое значение
integers[2] = 30

// Результат после замены
integers

//: ### Использование логического свойства isEmpty

if !integers.isEmpty {
    print(integers)
}

//: [Next](@next)
