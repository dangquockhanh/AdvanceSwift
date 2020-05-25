import UIKit

let myQueue = DispatchQueue(label: "myQueue", attributes: .concurrent)
let semaphore = DispatchSemaphore(value: 5)

for i in 0...14 {
    myQueue.async {
        let songNumber = i + 1
        semaphore.wait()
        print("Dang tai song: ", songNumber)
        sleep(2)
        print("DA tai xong song: ", songNumber)
        semaphore.signal()
    }
}
