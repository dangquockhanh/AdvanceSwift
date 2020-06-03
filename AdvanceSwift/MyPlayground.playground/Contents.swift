import UIKit

enum Operand: String {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
}

func operation(operand: Operand) -> ((Int, Int) -> Int) {
    func addition(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func subtraction(a: Int, b: Int) -> Int {
        return a - b
    }
    
    func multiplication(a: Int, b: Int) -> Int {
        return a * b
    }
    
    func division(a: Int, b: Int) -> Int {
        return a / b
    }
    
    switch operand {
    case .addition:
        return addition
    case .subtraction:
        return subtraction
    case .multiplication:
        return multiplication
    case .division:
        return division
    }
}

var functionAddition = operation(operand: Operand.addition)
print("1 + 2 = \(functionAddition(1,2))")

var functionSubtraction = operation(operand: Operand.subtraction)
print("8 - 2 = \(functionSubtraction(8,2))")

var functionMultiplication = operation(operand: Operand.multiplication)
print("8 * 2 = \(functionMultiplication(8,2))")

var functionDivision = operation(operand: Operand.division)
print("8 : 2 = \(functionDivision(8,2))")
