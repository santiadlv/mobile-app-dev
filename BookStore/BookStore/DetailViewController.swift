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
    
    func configureView() {
        //Update the user interface for the detail item.
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var detailItem: AnyObject? {
        didSet {
            //Update the view.
        }
    }
    
}
