import UIKit

//var str = "Hello, playground"
/*
 @State được sử dụng cho những kiểu dữ liệu đơn giản, thuộc về một view duy nhất và nên được khai báo private
 
 @ObservedObject sử dụng cho những kiểu dữ liệu phức tạp hơn như các class chúng ta định nghĩa và có thể được chia sẻ cho nhiều Views. Đây cũng là kiểu lưu trữ State hữu dụng và sử dụng phổ biết nhất
 
 @EnviromentObject sử dụng cho những thuộc tính được khởi tạo ở một nơi nào đó trong App nhưng có thể truy xuất ở mọi nơi
 
 @Binding được sử dụng khi muốn đánh dấu giá trị của một biến trong View được cung cấp từ một nơi khác và chia sẻ lẫn nhau
 */


var strAPi = "00020101021238520014A000000727013000069704030116211299504460402552045812530370454061800005802VN5910PHUONG CAC6005HANOI62110307NPS68696304D846"



//extension String {
//    func substring(from:Int, toSubstring s2 : String) -> Substring? {
//        guard let r = self.range(of:s2) else {return nil}
//        var s = self.prefix(upTo:r.lowerBound)
//        s = s.dropFirst(from)
//        return s
//    }
//}
//
//strAPi.substring(from: 0, toSubstring: "00")

extension StringProtocol {
    func ranges(of targetString: Self, options: String.CompareOptions = [], locale: Locale? = nil) -> [Range<String.Index>] {

        let result: [Range<String.Index>] = self.indices.compactMap { startIndex in
            let targetStringEndIndex = index(startIndex, offsetBy: targetString.count, limitedBy: endIndex) ?? endIndex
            return range(of: targetString, options: options, range: startIndex..<targetStringEndIndex, locale: locale)
        }
        return result
    }
}

// Usage
let str = "Hello, playground, playground, playground"
let ranges = str.ranges(of: "play")
ranges.forEach {
    print("[\($0.lowerBound.utf16Offset(in: str)), \($0.upperBound.utf16Offset(in: str))]")
}

// result - [7, 11], [19, 23], [31, 35]
