import UIKit

let driving = {
    print("I'm driving in my car")
}

driving()


let abc = { (place: String) in
    print("\(place)")
}
abc("khánh")

let bcd = {(place: String) -> String in
    return "\(place)"
}
let bb = bcd("khánh")
print(bb)

let driVing = {
    print("DRIVING")
}

driVing()

func travel( action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel(action: driving)
print("....")
travel() {
    print("I'm driving in my car")
}

travel {
    print("123")
}

var def = [1, 2, 3, 4, 5, 6]

let ghj = { (_ elementArray: [Int]) -> String in
    return "\(elementArray)"
}

let fgk = ghj(def)
print(fgk)




