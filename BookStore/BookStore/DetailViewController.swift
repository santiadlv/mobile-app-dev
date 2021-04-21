//
//  DetailViewController.swift
//  BookStore
//
//  Created by user192416 on 3/5/21.
//

import UIKit

class DetailViewController: UIViewController {
    //MARK: Properties
    
    var delegate: BookStoreDelegate? = nil
    var myBook = Book()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var pagesLabel: UILabel!
    @IBOutlet weak var readSwitch: UISwitch!
    
    func configureView() {
        //Update the user interface for the detail item.
        if let detailBook = detailItem {
            myBook = detailBook
            titleLabel.text = myBook.title
            authorLabel.text = myBook.author
            descriptionTextView.text = myBook.description
            bookImageView.load(url: myBook.imageURL!)
            bookImageView.image = bookImageView.image?.resizeImage(to: CGSize(width: 351, height: 220))
            pagesLabel.text = String(myBook.pages)
            if myBook.readThisBook {
                readSwitch.isOn = true
            } else {
                readSwitch.isOn = false
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editDetail" {
            if let controller = segue.destination as? AddViewController {
                controller.delegate = delegate
                controller.editBook = true
                controller.book = myBook
            }
        }
    }
    
    @IBAction func deleteBookAction(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Warning", message: "Delete this book?", preferredStyle: .alert)
        let noAction = UIAlertAction(title: "No", style: .cancel) { (action) in print("Cancel") }
        
        alertController.addAction(noAction)
        
        let yesAction = UIAlertAction(title: "Yes", style: .destructive) { (action) in self.delegate?.deleteBook(self)}
        
        alertController.addAction(yesAction)
        
        present(alertController, animated: false, completion: nil)
    }
    
    @IBAction func readBookWarning(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Warning", message: "Book not found in database", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }
    
    @IBAction func cancel(sender: AnyObject) {
        dismiss(animated: false, completion: nil)
    }

    var detailItem: Book? {
        didSet {
            //Update the view.
        }
    }
}

extension UIImage {
    func resizeImage(to newSize: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: newSize).image { _ in
            let hScale = newSize.height / size.height
            let vScale = newSize.width / size.width
            let scale = max(hScale, vScale) // scaleToFill
            let resizeSize = CGSize(width: size.width*scale, height: size.height*scale)
            var middle = CGPoint.zero
            if resizeSize.width > newSize.width {
                middle.x -= (resizeSize.width-newSize.width)/2.0
            }
            if resizeSize.height > newSize.height {
                middle.y -= (resizeSize.height-newSize.height)/2.0
            }
            
            draw(in: CGRect(origin: middle, size: resizeSize))
        }
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
