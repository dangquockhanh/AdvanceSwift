import UIKit

var numbers = [1, 2, 20, 20, 20]

// Tính tổng các số lẻ
func sumDecimal(numbers: [Int]) -> Int {
    var a = [Int]()
    var sum = 0
    for i in numbers {
        if i % 2 != 0 {
            a.append(i)
        }
    }
    sum = a.reduce(0, +)
    return sum
}

sumDecimal(numbers: numbers)

//Sắp xếp lại 1 dãy số từ dưới lên trên
func reverseNumber(_ numebrs: [Int]) -> [Int] {
    var reverse = [Int]()
    for i in numebrs {
        reverse.append(i)
    }
    
    return reverse.reversed()
}
