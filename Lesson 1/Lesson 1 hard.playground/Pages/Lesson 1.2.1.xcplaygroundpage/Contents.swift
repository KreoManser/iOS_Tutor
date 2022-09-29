//: [Previous](@previous)
import Foundation
//: ## Множества
//: > Хранят в себе неупорядоченные, но при этом уникальные значения одного типа

// Создание пустого множества с типом Character
var characters: Set<Character> = [] // Рекомендованный способ

// Создание пустого множества с типом Int
var integers = Set<Int>()

// Создание множества с типом String
var strings: Set<Character> = ["a", "a", "a", "b", "c"]

// Добавление нового элемента в множество
strings.insert("b")

// Проверка на наличие определенного элемента во множестве
strings.contains("a")

// Сортировка с использованием метода sorted() для последующей итерации по множеству
let newStrings = strings.sorted(by: >)
//: [Next](@next)
