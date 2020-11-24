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

let stringNames = names.reduce("") { "\($0) \($1)" }

stringNames

//6  Напишите функцию, которая принимает в себя функцию c типом (Void) -&gt; Void, которая будет вызвана с задержкой в две секунды.

func testFunc(void: Void) -> Void{
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: { return void })
}

testFunc(void: print("Hello"))

//7 Напишите функцию, которая принимает в себя две функции и возвращает функцию, которая при вызове выполнит первые две функции.
//Переопределение оператора + будет считаться?
func +(first: Void, second: Void) -> (Void, Void){
    return(first, second)
}
print("Hola") + print("Mundo")

func twoVoids(first: Void, second: Void) -> (Void, Void){
    return(first, second)
}
twoVoids(first: print("Hello"), second: print("World"))

//8 Напишите функцию, которая сортирует массив по переданному алгоритму: принимает в себя массив чисел и функцию, которая берёт на вход два числа, возвращает Bool (должно ли первое число идти после второго) и возвращает массив, отсортированный по этому алгоритму.
// Тут я не понял условие: должно сортироваться по какому алгоритму: возрастание? Убывание? Если честно, вообще не понял суть задачи, смог начать логику: в правильном направлении думаю?
typealias Sor = (Int, Int)

func sorting(sor: Sor) -> Bool{
    return sor.0 > sor.1
}
sorting(sor: (300, 55))

func superSorting(arr: [Int], sor: Sor) -> [Int]{
    return []
}


//9
/*
 prefix, postfix, infix - пользовательские операторы. Объявляются на глобальном уровне(например prefix operator +++). prefix, postfix - определяет приоритео оператора соответственно.
 Каждый infix оператор принадлежит к своей приоритетной группе.
 */
