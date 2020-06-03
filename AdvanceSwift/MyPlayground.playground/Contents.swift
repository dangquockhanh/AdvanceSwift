import UIKit

// Bubble Sort

var array = [1, 4, 8, 2, 5]
for i in 0..<array.count {
    for j in 1..<array.count {
        if array[i] < array[j-1] {
            let tmp = array[j-1]
            array[j-1] = array[i]
            array[i] = tmp
        }
    }
}
print(array)



//class Dog {
//    var name = ""
//    var whatADogSays = "woof"
//
//    func bark() {
//        print(self.whatADogSays)
//    }
//
//    func speak() {
//        self.bark()
//    }
//
//}

//class Dog {
//    var name = ""
//    var whatADogSays = "woof"
//    func bark() {
//        print(whatADogSays)
//    }
//
//    func speak() {
//        bark()
//    }
//}
//
//let dog = Dog()
//dog.speak()

//struct Dog {
//    var name = ""
//    var whatADogSays = "woof"
//
//    func bark() {
//        print(self.whatADogSays)
//    }
//
//    func speak() {
//        print(self.whatADogSays)
//    }
//}

//var dog1 = Dog()
//dog1.whatADogSays

//func sayStrings(_ arrayOfStrings:String ...) {
//    for s in arrayOfStrings {
//        print(s, 3, true)
//    }
//}
//
//sayStrings("a", "asd")

//func doThis(_ f: () -> ()) {
//    f()
//}
//let d = Dog()
//let barkFunction = d.bark
//doThis(barkFunction)
//d.whatADogSays = "asd"
//doThis(barkFunction)

//func countAdder(_ f: @escaping () -> ()) -> () -> () {
//    var ct = 0
//    return {
//        ct = ct + 1
//        print("count is \(ct)")
//        f()
//        
//    }
//}
