//
//  ViewController.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 5/25/20.
//  Copyright © 2020 Đặng Khánh . All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    let JSON = """
    {
        "title": "Optionals in Swift explained: 5 things you should know",
        "url": "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/",
        "category": "swift",
        "views": 47093
    }
    """
    let JSON1 = """
    [{
        "title": "Optionals in Swift explained: 5 things you should know",
        "url": "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/"
    },
    {
        "title": "EXC_BAD_ACCESS crash error: Understanding and solving it",
        "url": "https://www.avanderlee.com/swift/exc-bad-access-crash/"
    },
    {
        "title": "Thread Sanitizer explained: Data Races in Swift",
        "url": "https://www.avanderlee.com/swift/thread-sanitizer-data-races/"
    }]
    """
    
    let JSON3 = """
    {
        "title": "Optionals in Swift explained: 5 things you should know",
        "date": "2019-10-21T09:15:00Z"
    }
    """
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        parseJson()
    }
    
    func parseJson() {
        
//        let jsonData = JSON.data(using: .utf8)!
//        let blogPost: BlogPost = try! JSONDecoder().decode(BlogPost.self, from: jsonData)
//
//        print(blogPost.title)
        
        
//        let jsonData = JSON1.data(using: .utf8)!
//        let blogPosts: [BlogPost] = try! JSONDecoder().decode([BlogPost].self, from: jsonData)
//        print(blogPosts.count) // Prints: 3
        
        let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            let jsonData = JSON3.data(using: .utf8)!
            let blogPost: BlogPost = try! decoder.decode(BlogPost.self, from: jsonData)
            print(blogPost.date)
    }

}
