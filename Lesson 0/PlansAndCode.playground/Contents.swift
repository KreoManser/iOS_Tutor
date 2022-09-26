import UIKit

// MARK: - CODE STYLE

/*
Main:
 - все проперти и функции пишем в стиле lowerCamelCase
 - class, struct, enum, protocol в стиле UpperCamelCase
Стоит научиться:
 - Писать все переменные с констант(let)
 - Методы из ООП(или прочих типов данных) писать с модификатора доступа private
*/

/// Правильное оформление, без принудительной инициализации, начинается с константы
let someInt = 1
let twoBoys = [ 2, 3, 4 ]

/// Неправильное оформление - был вызван принудительный инициализатор! (String)
let one: String = "2"

/// В случае изменения КОНСТАНТЫ swift вам скажет:
/// Cannot assign to value: 'someInt' is a 'let' constant
//twoBoys[0] = 3

let flag = true

/// Else сносим на уровне скобок!
if flag {
    print(1)
} else {
    print(2)
}

/// Тернарный оператор
/// Вид: (a ? b : c)
/// Где a - условие(булево значение)
/// b, c - Исходы; При этом b наступит в случае True, c наступит в случае False
let contentHeight = 40
let hasHeader = false
let rowHeader = contentHeight + (hasHeader ? 50:20)
print(rowHeader)

// MARK: - Functions

/// Пишутся также в lowerCamelCase
/// Название всегда глагол(действие), названия переменных должны перекликаться - ниже пример.
func buttonTappedAndSentMessage(by finger: [Int], to user: String) {
    /// Давайте условимся, кнопка была нажата - это первое действие
    /// Сообщение было отправлено юзерУ - это второе действие
    /// Чувствуте связь? Название перекликается, а теперь давайте уберем например "to" у user,
    /// Получится переворот смысла - юзер отправляет - но ведь это противоречит нашему условию)
    /// Так что думайте, когда называете свои переменные :)
    //1) buttonTappedFinger
    //2) SentMessageToUser
}

// MARK: - OOP

/// Что-то на ООП'шном... - функции в классе называются МЕТОДами(Не функции!)
/// Названия в UpperCamelCase
///
/// Поговорим об уровне доступа(инкапсуляция) private
///
/// Давайте представим, что вы разработали игру "моя ферма"
/// У нас есть действие полить растение(water) и рост растения(grow)
/// Метод поливки доступен игроку, а вот метод роста - нет, вы же не подойдете в реальной жизни
/// к растению и не скажите "расти"(магия, оно выросло), тут также, чтобы избежать лишних ошибок:
/// - Учимся писать методы с уровня доступа private
/// - В случае обращения к нему, свифт выдаст: 'grow' is inaccessible due to 'private' protection level
/// - Так что, если вам вдруг понадобится обратиться к нему - просто измените уровень доступа, а до тех пор поберегите себя от лишнего рефакторинга, поверьте, оно вам не надо))))
class MyFarm {
    
    func water() {
        grow()
    }
    
    private func grow() {
        
    }
}

let game = MyFarm()
game.water()
//game.grow()

// MARK: - Algorithm CodeWars

// https://www.codewars.com/kata/515e271a311df0350d00000f/train/swift - ссылка на задачку

func squareSum(_ vals: [Int]) -> Int {
    return vals.map { $0 * $0 }
           .reduce(0, +)
}

/// Перегрузка в свифте - одинаковые названия, различия лишь в способе вызова функции по имени(by, вместо пустоты)
func squareSum(for vals: [Int]) -> Int {
    return vals.map { $0 * $0 }
           .reduce(0, +)
}

print(squareSum([1, 2, 2]))
/// TeaCode - приложение для быстрого написания кода
/// Например:
func otherDoes(name: String?) -> String {
    /// gl name стал
    guard let name = name else {
        return "Error"
    }
    return name
}
