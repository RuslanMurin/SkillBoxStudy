import Cocoa

// 2 Pure Function
/*
 Чистая функция - математическая функция, вычистления которой не зависят от внешних глобальных состояний.  То есть при одинаковом наборе входных параметров
 она вернет абсолютно такой же результат при любом количестве вычислений
 */

//3 Отсортируйте массив чисел по возрастанию, используя функцию Sorted.

let intArray = [30, 25, 48, 55, 64, 3, 15]
intArray.sorted(by: <)

//4 Переведите массив чисел в массив строк с помощью функции Map.

let stringArray = intArray.map{ String($0) }

stringArray

//5 Переведите массив строк с именами людей в одну строку, содержащую все эти имена, с помощью функции Reduce.

let names = ["John", "Max", "Steve", "Tim", "Eve", "Sarah"]

let stringNames = names.reduce("") { $0 == "" ? "\($1)" : "\($0) \($1)"
}
let anotherStringNames = names.reduce("") {"\($0) \($1)"}.trimmingCharacters(in: .whitespaces) //второй вариант
stringNames
anotherStringNames
//6  Напишите функцию, которая принимает в себя функцию c типом (Void) -&gt; Void, которая будет вызвана с задержкой в две секунды.

func testFunc(_ closure: @escaping () -> Void){
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: { closure() })
}
testFunc({ print("Hi after 2 seconds") })

//7 Напишите функцию, которая принимает в себя две функции и возвращает функцию, которая при вызове выполнит первые две функции.

var firstClosure: () -> Void = { print("1st closure") }
var secondClosure: () -> Void = { print("2nd closure") }
func completeClosures(a: @escaping() -> Void, b: @escaping() -> Void) -> (() -> Void){
    let args = [a, b]
    let closure = {
        for arg in args{
            arg()
        }
    }
    return closure
}
completeClosures(a: {print("1")}, b: {print("2")})

//8 Напишите функцию, которая сортирует массив по переданному алгоритму: принимает в себя массив чисел и функцию, которая берёт на вход два числа, возвращает Bool (должно ли первое число идти после второго) и возвращает массив, отсортированный по этому алгоритму.
func forward(_ x1: Int, _ x2: Int)->Bool{
    return x2 > x1
}

func superSort(arr: [Int], by: (Int, Int) -> Bool) -> [Int]{
    return arr.sorted(by: by)
}
let sortedArr = superSort(arr: intArray, by: forward(_:_:))
print(sortedArr)

//9
/*
prefix/postfix - унарные операторы, infix - бинарный.
 инфиксный оператор называется так, потому что он работает с двумя целями МЕЖДУ которыми находится
 унарные операторы являются префиксными, если они предшествуют своей цели(-5), и постфиксными, если они идут после неё(a!)
 */
