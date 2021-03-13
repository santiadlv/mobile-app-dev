//
//  DetailViewController.swift
//  BookStore
//
//  Created by user192416 on 3/5/21.
//

import UIKit

class DetailViewController: UIViewController {
    //MARK: Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var bookImageView: UIImageView!
    
    func configureView() {
        //Update the user interface for the detail item.
        if let myBook = detailItem {
            titleLabel.text = myBook.title
            authorLabel.text = myBook.author
            descriptionTextView.text = myBook.description
            bookImageView.load(url: myBook.imageURL!)
            bookImageView.image = bookImageView.image?.resizeImage(to: CGSize(width: 351, height: 220))
        }
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
