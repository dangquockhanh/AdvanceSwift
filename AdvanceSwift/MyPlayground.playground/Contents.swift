import UIKit

var arr = [1, 10, 3, 4, 5]

arr.append(contentsOf: arr)
arr.append(3)
arr.remove(at: 0)
arr.capacity
arr.distance(from: 1, to: 8)
arr.hashValue

var arr1 = [1, 2, 3, 4]
var arr2 = [5, 6, 7, 8, 9, 12, 24, 1, 4, 2, 3]
var arr3 = arr1 + arr2

extension Array where Element: Comparable {
    func bubbleSort() -> Array<Element> {
        //check for trivial case
        guard self.count > 1 else {
            return self
        }
        //mutated copy
        var output: Array<Element> = self
        for primaryIndex in 0..<self.count {
            let passes = (output.count - 1) - primaryIndex
            //"half-open" range operator
            for secondaryIndex in 0..<passes {
                let key = output[secondaryIndex]
                //compare / swap positions
                if (key > output[secondaryIndex + 1]) {
                    output.swapAt(secondaryIndex, secondaryIndex + 1)
                } }
        }
        return output
    }
}

arr2.bubbleSort()

func insertionSort(_ array: [Int]) -> [Int] {
    var a = array
    for x in 1..<a.count {
        var y = x
        while y > 0 && a[y] < a[y - 1] {
            a.swapAt(y - 1, y)
            y -= 1
        }
    }
    return a
}

insertionSort(arr2)

var arr4 = [1, 2, 3, 4]

for i in arr4 {
    var b = [Int]()
    if i % 2 == 0 {
        b.append(i)
        print(b)
}
}
