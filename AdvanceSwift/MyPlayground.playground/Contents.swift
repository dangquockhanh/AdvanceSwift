import UIKit
import PlaygroundSupport


//class WWDCMasterViewController: UITableViewController {
//
//    var reasons = ["the labs are great", "the sessions teach new things", "the people are awesome", "the keynote rocks", "I must hug Joe Groff"]
//
//    override func viewDidLoad() {
//        title = "Reasons I should attend WWDC"
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return reasons.count
//    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // attempt to dequeue a cell
//        var cell: UITableViewCell!
//        cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
//
//        if cell == nil {
//            // none to dequeue – make a new one
//            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
//            cell?.accessoryType = .disclosureIndicator
//        }
//
//        let reason = reasons[indexPath.row]
//        cell.detailTextLabel?.text = "I want to attend because \(reason)"
//        cell.textLabel?.text = "Reason #\(indexPath.row + 1)"
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let text = tableView.cellForRow(at: indexPath)?.detailTextLabel?.text else { return }
//
//        let detail = WWDCDetailViewController()
//        detail.message = text
//        navigationController?.pushViewController(detail, animated: true)
//    }
//}
//
//class WWDCDetailViewController: UIViewController {
//     var message = ""
//
//    override func loadView() {
//        title = "Please let me go"
//        view = UIView()
//        view.backgroundColor = UIColor.white
//    }
//}
//
//let master = WWDCMasterViewController()
//let nav = UINavigationController(rootViewController: master)
//PlaygroundPage.current.liveView = nav


let view = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 736))
view.backgroundColor = .systemBlue

let loginLabel = UILabel(frame: CGRect(x: 160, y: 54, width: 84, height: 24))
loginLabel.text = "Đăng nhập"
loginLabel.textColor = .white

let photoCenter = UIImageView(frame: CGRect(x: 65, y: 110, width: 287, height: 240))
photoCenter.backgroundColor = .white

let label = UILabel(frame: CGRect(x: 130, y: 382, width: 222, height: 22))
label.text = "Tra cứu lịch vạn niên"
label.textColor = .white


view.addSubview(label)
view.addSubview(photoCenter)
view.addSubview(loginLabel)

PlaygroundPage.current.liveView = view

