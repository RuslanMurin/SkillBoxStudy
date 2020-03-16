# SkillBoxStudy


//2
/*
 внутри функции можно объявить другую функцию, то есть вложенную функцию
 Пример:
 */
func compare(_ r1: Double, _ r2: Double){
     
    func square(_ r: Double) -> Double{ return r * r * 3.14}
     
    let s1 = square(r1)
    let s2 = square(r2)
     
    print("разница площадей:", (s1 - s2))
}

//3
func stringArr(_ array: String...) -> String{
    var stringData = ""
    for (index, string) in array.enumerated(){
        stringData += string
        if index != array.count - 1{
            stringData += ", "
        }
    }
    return (stringData)
}
stringArr("John", "Ilon", "Jake", "Ilon")


//4
func doubleFunc(_ a: Int, _ b: Int) -> (doubleA: Int, doubleB: Int){
    
    let temp = a
    let a = b * 2
    let b = temp * 2
    
    return  (a, b)
}

doubleFunc(12, 9)


//5
func boolArray(_ arr1: [Int] , _ arr2: [Int] ) -> Bool{
    let compare: Bool
    
    var sum1 = 0
    var sum2 = 0
    
    for el in arr1{
        sum1 += el
    }
    for el in arr2 {
        sum2 += el
    }
     
    compare = (sum1 > sum2) ? true : false
    return (compare)
}
boolArray([7, 8, 10], [5, 6, 3])


//6
func sortedArray(_ array: Int...) -> ([Int]) {
    
    var sortedArray = array
    sortedArray.sort(by: >)
    return (sortedArray)
}
sortedArray(18, 3, 34, 5)


//7.
func mean(_ array: Int...) -> Int {
    var sum = 0
    for el in array{
        sum += el
    }
    let mean = sum / array.count
    return (mean)
}
mean(1, 2, 3, 4, 5, 6, 7, 8, 9)


//8
func finder(_ array: [String], toFind: String) -> Int?{
    
    var result: Int? = nil
    
    for (index, value) in array.enumerated(){
        if toFind == value{
            result = index
        }
      
    }
    return (result)
}
finder(["Jack","Scott","Lily","Max"], toFind: "Scott")

//9
// будет young man, поскольку строка не прреобразуется в  Int,  значит  age будет равен 0

//10
//4? (мог ошибиться, из-за порядка, в компиляторе специально не проверяю)

/*
 Бонусные
 1. Да, в функции можно вернуть кортеж, например, когда из одного массива на входе нужно вывести минимум, максимум и вообще что-либо еще. Так же можно выводить
 опциональные кортежи, то есть кортежи, которые могут быть равны nil, или элементы которых могут быть равны  nil.  Но важно понимать, что (Int?, Int?) это не
 то же самое, что (Int, Int)?
 2. Восклицательный знак используется в том случае, если мы точно уверены, что опшионал не будет равен  nil, но не использовать опшионал мы не можем. Тут важно
 быть внимательным и осторожным, потому что при реальном отсутвии значения программа вылетит.
 */
/*
 Прошлое доп. задание
 let max = Int(String(Int.max))!

 let overflow = max + 1
 Как раз яркий пример того, что код скомпилируется (хотя тут я и правда не понимаю, почему должен), но при выполнении программа вылетит. Получается, что по
 возможности ! лучше не использовать.
*/
