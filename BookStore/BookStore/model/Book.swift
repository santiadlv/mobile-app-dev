//
//  Book.swift
//  BookStore
//
//  Created by user192416 on 3/5/21.
//

import Foundation

class Book {
    var title: String = ""
    var author: String = ""
    var description: String = ""
    var imageURL: URL? = URL(string: "https://static.thenounproject.com/png/82078-200.png")
    var pages: Int = 0
    var readThisBook: Bool = false
}
