//
//  ViewController.swift
//  AdvanceSwift
//
//  Created by Đặng Khánh  on 5/25/20.
//  Copyright © 2020 Đặng Khánh . All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items: [Person]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        fetchPeople()
    }
    // fetch the data from Core data to display in the tableView
    func fetchPeople() {
        do {
//            self.items = try context.fetch(Person.fetchRequest())
            
            let request = Person.fetchRequest() as NSFetchRequest<Person>
                     
            //Set filtering on the tableView
//            let pred = NSPredicate(format: "name CONTAINS 'Thu'")
            let pred = NSPredicate(format: "name CONTAINS %@","khanh")
            request.predicate = pred
            
            // Sort sorting on the tableView
//            let sort = NSSortDescriptor(key: "name", ascending: true)
//            request.sortDescriptors = [sort]
            
            self.items = try context.fetch(request)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            print("error")
        }
    }
    
    @IBAction func addTapped(_sender: Any) {
        //Create the alert
        let alert = UIAlertController(title: "Add Person", message: "What is their name?", preferredStyle: .alert)
        alert.addTextField()
        // Creat the Button add the data
        let submitButton = UIAlertAction(title: "Add", style: .default) { (action) in
            let textfield = alert.textFields![0]
            
        // Create the data object
            let newPerson = Person(context: self.context)
            newPerson.name = textfield.text
            newPerson.age = 20
            newPerson.gender = "Male"
        
        // Save the data
            do {
                try self.context.save()
            }
            catch {
                
            }
        // Re-fetch the data
            self.fetchPeople()
            
        }
        alert.addAction(submitButton)
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        
        let person = self.items![indexPath.row]
        cell.textLabel?.text = person.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let person = self.items![indexPath.row]
        // Create alert
        let alert = UIAlertController(title: "Edit Person", message: "Edit Name", preferredStyle: .alert)
        alert.addTextField()
        
        let textfield = alert.textFields![0]
        textfield.text = person.name
        
        //Configure button handler
        let saveButton = UIAlertAction(title: "Save", style: .default) { (action) in
            let textfield = alert.textFields![0]
            
            person.name = textfield.text
            
            // Save the data
            do {
                try self.context.save()
            }
            catch {
                
            }
            //Re-fetch the data
            self.fetchPeople()
        }
        
        alert.addAction(saveButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
        let personToRemove = self.items![indexPath.row]
        
        
        self.context.delete(personToRemove)
        
        do {
            try! self.context.save()
        }
        
        self.fetchPeople()
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}
