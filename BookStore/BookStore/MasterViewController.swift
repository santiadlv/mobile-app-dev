//
//  ViewController.swift
//  BookStore
//
//  Created by user192416 on 3/5/21.
//

import UIKit

class MasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, BookStoreDelegate {
    
    func newBook(_ controller: AnyObject, newBook: Book) {
        myBookStore.bookList.append(newBook)
        tableView.reloadData()
        navigationController?.popToRootViewController(animated: true)
    }
    
    func editBook(_ controller: AnyObject, editBook: Book) {
        if let row = tableView.indexPathForSelectedRow?.row {
            myBookStore.bookList[row] = editBook
        }
        
        tableView.reloadData()
        navigationController?.popToRootViewController(animated: true)
    }
    
    func deleteBook(_ controller: AnyObject) {
        if let row = tableView.indexPathForSelectedRow?.row {
            myBookStore.bookList.remove(at: row)
        }
        
        tableView.reloadData()
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Properties
    var detailViewController: DetailViewController? = nil
    var myBookStore = BookStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedBook: Book = myBookStore.bookList[indexPath.row]
                let controller = (segue.destination as! DetailViewController)
                controller.detailItem = selectedBook
                controller.delegate = self
            }
        } else if segue.identifier == "addBookSegue" {
            let vc = segue.destination as! AddViewController
            vc.delegate = self
        }
    }
    
    //MARK: Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myBookStore.bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel!.text = myBookStore.bookList[indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
