import UIKit

var str = "Hello, playground"

let array = [1, 2, 3, 4]
var set: Set<String> = ["1", "2", "3"]
var tuples = ("String123", 123, array, set, str)
print(tuples.2)

var wesite = (name: "apple", url: "www.apple.com")
wesite.name
wesite.url

var wesite2 = ["Apple", "www.apple.com"]

wesite2[0]

//var i = 2

//do {
//    print(i)
//    i *= 2
//} while (i < 128)

//struct Spaceship {
//    var name: String {
//        willSet {
//            print("I'm called \(newValue)!")
//        }
//    }
//}
//
//var serenity = Spaceship(name: "Serenity")
//serenity.name = "TARDIS"


let oneMillion = 1_000_000
let oneThousand = oneMillion / 0_1_0_0_0
print(oneThousand)

var numbers = [1, 2, 3]
numbers += [4]

struct Spaceship {
    var name: String {
        willSet {
            print("I'm called \(newValue)!")
        }
    }
}

var serenity = Spaceship(name: "Serenity")
serenity.name = "TARDIS"
serenity.name = "KHA"
