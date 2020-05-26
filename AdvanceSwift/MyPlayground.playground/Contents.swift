import UIKit

//let myQueue = DispatchQueue(label: "myQueue", attributes: .concurrent)
//let semaphore = DispatchSemaphore(value: 5)
//
//for i in 0...14 {
//    myQueue.async {
//        let songNumber = i + 1
//        semaphore.wait()
//        print("Dang tai song: ", songNumber)
//        sleep(2)
//        print("DA tai xong song: ", songNumber)
//        semaphore.signal()
//    }
//}

//let queue = DispatchQueue(label: "queue")
//queue.sync {
//    for i in 0..<5 {
//        print("number_A: ", i)
//    }
//}
//
//queue.async {
//    for i in 10..<15 {
//        print("number_B: ", i)
//    }
//}
//for i in 20..<25 {
//    print("number_C: ", i)
//}

//let serialQueue = OS_dispatch_queue_serial(label: "com.framgia.serialQueue")
//
//serialQueue.async() { () -> Void in
//    // Do task 1 code
//    print("1")
//}
//
//serialQueue.async() { () -> Void in
//    // Do task 2 code
//    print("2")
//}
//
//serialQueue.async() { () -> Void in
//    // Do task 3 code
//    print("3")
//}

//let serialQueue1 = OS_dispatch_queue_serial(label: "com.framgia.serialQueue")
//
//serialQueue1.async() { () -> Void in
//    // Do task 1 code
//    print("1")
//}
//
//serialQueue1.async() { () -> Void in
//    // Do task 2 code
//    print("2")
//}
//
//let serialQueue2 = OS_dispatch_queue_serial(label: "com.framgia.serialQueue")
//
//serialQueue2.async() { () -> Void in
//    // Do task 3 code
//    print("3")
//}

let concurrentQueue = dispatch_queue_global_t(label: "0")

concurrentQueue.async() { () -> Void in
    // Do task 1 code
    print("1")
}

concurrentQueue.async() { () -> Void in
    // Do task 2 code
    print("2")
}

concurrentQueue.async() { () -> Void in
    // Do task 3 code
    print("3")
}
