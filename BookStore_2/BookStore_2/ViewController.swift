//
//  ViewController.swift
//  BookStore_2
//
//  Created by user192416 on 4/6/21.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    var managedObjectContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext as NSManagedObjectContext
    }
    
    func loadBooks() -> [Book] {
        let fetchRequest: NSFetchRequest<Book> = Book.fetchRequest()
        let idSort: NSSortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [idSort]
        var result: [Book] = []
        
        do {
            result = try managedObjectContext.fetch(fetchRequest)
        } catch {
            NSLog("My error: %@", error as NSError)
        }
        
        return result
    }


    @IBAction func addNew(_ sender: UIBarButtonItem) {
        let book: Book = NSEntityDescription.insertNewObject(forEntityName: "Book", into: managedObjectContext) as! Book
        
        let fetchRequest: NSFetchRequest<Book> = Book.fetchRequest()
        let idSort: NSSortDescriptor = NSSortDescriptor(key: "id", ascending: false)
        fetchRequest.sortDescriptors = [idSort]
        fetchRequest.fetchLimit = 1
        var result: [Book] = []
        
        do {
            result = try managedObjectContext.fetch(fetchRequest)
        } catch {
            NSLog("My error: %@", error as NSError)
        }
        
        book.id = Int32(result[0].id + 1)
        book.title = "My Book " + String(book.id)
        
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            NSLog("My error: %@", error)
        }
        
        myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadBooks().count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        else {
            return UITableViewCell()
        }
        
        let book: Book = loadBooks()[indexPath.row]
        cell.textLabel?.text = book.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let book: Book = loadBooks()[indexPath.row]
            managedObjectContext.delete(book)
            do {
                try managedObjectContext.save()
            } catch let error as NSError {
                NSLog("My error: %@", error)
            }
            myTableView.reloadData()
        }
    }
}

