import Cocoa

//protocol A{
//    func a()
//}
//protocol B{
//    func b()
//}
//extension B{
//    func b(){
//        print("B")
//    }
//}
//class C: A{
//    func a() {
//        print("A")
//    }
//    func c(){
//        print("C")
//    }
//}
//class D: C, B{
//    func b() {
//        print("B")
//    }
//    func d(){
//        print("D")
//    }
//}                         //выглядит запутанно

//let v1: A = D()
//v1.a()                  //вывод a
//let v2: B = C()         //можно ли вообще после двоеточия ставить B?(это же расширение)
//v2.c()
//let v3: C = D()
//v3.d()                  //тут можно реализовать  a, c
//let v4: D = D()
//v4.a()                //вывод a, но должно быть можно и b,c,d(наследуются все функции)


//2.
// Инкапсуляция - свойство, позволющее обЪединить данные и методы работы с ними. Например, при работе с классами мы помещаем в них данные(переменные,
//константы) и функции(методы)
//Наследование - свойство классов перенимать(наследовать) методы и данные от родительского класса
//Полиморфизм - свойство объектов с одинаковым интерфейсом иметь разную реализацию
protocol Audi{
    func model() -> (String, String)
}
class Equipment{
    let price:Int
    let name:String
    let color:String
    let engineVolume:Double
    init(name: String, price: Int, color: String, engineVolume:Double) {        //Инкапсуляция(реализация констант в классе Equipment)
        self.color = color
        self.name = name
        self.engineVolume = engineVolume
        self.price = price
    }
}
class A6:Equipment, Audi{                                                       //Наследование(Родительский - Equipment, наследник - A6)

    func model() -> (String, String) {
        let model = "A6"
        let image = "\(model).jpg"
        return (model, image)
    }
}
class A7:Equipment, Audi {
    func model() -> (String, String) {
        let model = "A7"
        let image = "\(model).jpg"
        return (model, image)
    }
}
class A8:Equipment, Audi {                                                      //A6, A7, A8 - один интерфейс(Audi), разные реализации
    func model() -> (String, String) {
        let model = "A8"
        let image = "\(model).jpg"
        return (model, image)
    }
}
//3. Видео посмотрел, интересно осознавать, что у всего, что просто используется есть свои названия и классификации)
//4.Решил повторить реализацию из видео для начала.

class Cap{                                                  //Агрегация
   let color = "red"
    
    func checkColor() -> String{
        return "I got \(color) cap"
    }
}


class Human{
    func think(){
        thinking.think()
    }
    
    class Brain{
        func think(){
            print("I'm thinking")                           //Композиция
        }
    }
    let thinking = Brain()
    let cap = Cap()
}

let anton = Human()
anton.think()
print(anton.cap.checkColor())

//Возьмем определенное авто. У всех машин есть двигатель, но допустим опциональным будет спойлер


class Spoiler{                                              //Агрегация
    let gotSpoiler: Bool
    init(gotSpoiler: Bool) {
        self.gotSpoiler = gotSpoiler
    }
}


class MyCar{
    func greet(){
        if spoiler.gotSpoiler == true{
            print("That's my \(self.mark) with \(self.power.power) kW engine power and she got spoiler")
            
        } else{
            
        print("That's my \(self.mark) with \(self.power.power) kW engine power with no spoiler")}
    }
    
 let mark = "Toyota"
    class Engine{                                                                                     //Композиция
        let power = 300
    }
    var spoiler = Spoiler(gotSpoiler: true)
    let power = Engine()
}

let toyota = MyCar()
toyota.greet()

//5. Сама возможность использования протоколов со структурами/энумами

protocol Proty{
    func fff()
}

struct Str: Proty{
    func fff() {
        print("Trat's Proty realisation")
    }
}

enum En: Proty{
    case realisation(String)
    
    func fff() {
        En.realisation("Trat's Proty realisation")
        print(En.realisation)
    }
}

//6.

protocol FullNamed{
    var fullname:String { get }
}

struct UserFullName: FullNamed{
    var firstName: String
    var lastName: String
    
    var fullname: String{
        return firstName + " " + lastName
    }
}
var user = UserFullName(firstName: "John", lastName: "Dorian")
print(user.fullname)
// Реализация применима для многих программ: пользователь вводит в отдельные поля имя и фамилию, с помощью протокола соединяем
