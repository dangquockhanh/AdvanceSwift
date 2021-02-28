import UIKit
import Combine

let array = [1, 2, 3, 4, 5].publisher

let subscriber = Set<AnyCancellable>()

let pass = PassthroughSubject<Int, Never>()

pass.send(1)
pass.send(2)
pass.sink { subscriber in
    <#code#>
}
