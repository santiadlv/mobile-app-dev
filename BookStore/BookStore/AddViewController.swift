//
//  AddViewController.swift
//  BookStore
//
//  Created by user192416 on 4/20/21.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    
    var book: Book = Book()
    var delegate: BookStoreDelegate?
    var editBook = false

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var authorText: UITextField!
    @IBOutlet weak var pagesText: UITextField!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var switchOutlet: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleText.delegate = self
        authorText.delegate = self
        pagesText.delegate = self
        
        if editBook {
            self.title = "Edit Book"
            titleText.text = book.title
            authorText.text = book.author
            pagesText.text = String(book.pages)
            descriptionText.text = book.description
            
            if book.readThisBook {
                switchOutlet.isOn = true
            } else {
                switchOutlet.isOn = false
            }
        } else {
            self.title = "Add Book"
        }
    }

    @IBAction func saveBook(_ sender: UIButton) {
        book.title = titleText.text!
        book.author = authorText.text!
        book.description = descriptionText.text!
        
        if let text = pagesText.text, let pages = Int(text) {
            book.pages = pages
        }
        
        if switchOutlet.isOn {
            book.readThisBook = true
        } else {
            book.readThisBook = false
        }
        
        if editBook {
            delegate?.editBook(self, editBook: book)
        } else {
            delegate?.newBook(self, newBook: book)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
