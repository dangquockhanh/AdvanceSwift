//
//  ViewController.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 5/25/20.
//  Copyright © 2020 Đặng Khánh . All rights reserved.
//

import UIKit
import Foundation

struct GetListsBooks {
    var statusExpand: Bool?
    var title: String?
    var descriptions: String?
}


class ViewController: UIViewController {
    
    @IBOutlet var listTableView: UITableView!
    var stateClick = false
    
    var listBooks: [GetListsBooks]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.dataSource = self
        listTableView.delegate = self
        listTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        listBooks = [GetListsBooks(statusExpand: true,
                          title: "Sách loại 1",
                          descriptions: "Đắc nhân tâm là một quyển sách thuộc thể loại Sách tự lực - sách tự giúp bản thân. Bản tiếng Việt do Nguyễn Hiến Lê dịch và đưa vào tủ sách học làm người. Đắc nhân tâm bao gồm sáu phần, tương tự như sáu mảnh ghép của cuộc sống tạo nên một bức tranh đa sắc màu: Phần I: Nghệ thuật ứng xử căn bản tối thiểu của con người ngỡ như giản đơn nhưng không phải ai cũng có những cách cư xử đúng đắn thường trực ở mọi lúc, mọi nơi.Phần II: Sáu cách tạo thiện cảm từ những lần gặp đầu tiên để làm thế nào đọng lại những ký ức tốt đẹp của mình trong tâm trí của người khác mà chẳng cần phải nhất thân, nhì thế. - Phần III:  Mười hai cách hướng người khác theo suy nghĩ của mình, khả năng thuyết phục đối phương có được cùng chiến tuyến với mình, không cần đến những lời dọa nạt hay bạo lực.- Phần IV: Chuyển hóa người khác mà không gây ra sự chống đối hay oán hận, luôn biết cách tạo ra được những sự đồng thuận nơi đối thủ của mình một cách khôn khéo nhất để không phải hình thành nên những mâu thuẫn không đáng có.- Phần V: Những bức thư mầu nhiệm- Phần VI: Bảy lời khuyên để tăng hạnh phúc trong gia đình."),
                     GetListsBooks(statusExpand: false,
                                       title: "Sách loại 2",
                                       descriptions: "Đắc nhân tâm là một quyển sách thuộc thể loại Sách tự lực - sách tự giúp bản thân. Bản tiếng Việt do Nguyễn Hiến Lê dịch và đưa vào tủ sách học làm người. Đắc nhân tâm bao gồm sáu phần, tương tự như sáu mảnh ghép của cuộc sống tạo nên một bức tranh đa sắc màu: Phần I: Nghệ thuật ứng xử căn bản tối thiểu của con người ngỡ như giản đơn nhưng không phải ai cũng có những cách cư xử đúng đắn thường trực ở mọi lúc, mọi nơi.Phần II: Sáu cách tạo thiện cảm từ những lần gặp đầu tiên để làm thế nào đọng lại những ký ức tốt đẹp của mình trong tâm trí của người khác mà chẳng cần phải nhất thân, nhì thế. - Phần III:  Mười hai cách hướng người khác theo suy nghĩ của mình, khả năng thuyết phục đối phương có được cùng chiến tuyến với mình, không cần đến những lời dọa nạt hay bạo lực.- Phần IV: Chuyển hóa người khác mà không gây ra sự chống đối hay oán hận, luôn biết cách tạo ra được những sự đồng thuận nơi đối thủ của mình một cách khôn khéo nhất để không phải hình thành nên những mâu thuẫn không đáng có.- Phần V: Những bức thư mầu nhiệm- Phần VI: Bảy lời khuyên để tăng hạnh phúc trong gia đình.")
        ]
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listBooks?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listTableView
                .dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell  else {
            return UITableViewCell()
        }
        
        guard var element = listBooks?[indexPath.row] else { return UITableViewCell()}
        
        cell.closureCell = { (cell, state) in
            if let selectedIndex = self.listTableView.indexPath(for: cell) {
                self.listTableView.selectRow(at: selectedIndex, animated: true, scrollPosition: .none)
                element.statusExpand = state
                cell.heightCell.constant = state ? 150 : 70
                self.listTableView.reloadData()
            }
        }
        
        cell.descriptionLabel.text = element.descriptions
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !stateClick {
            print("1")
        }
    }
}
