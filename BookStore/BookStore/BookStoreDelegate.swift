//
//  BookStoreDelegate.swift
//  BookStore
//
//  Created by user192416 on 4/20/21.
//

import Foundation

protocol BookStoreDelegate {
    func newBook(_ controller: AnyObject, newBook: Book)
    func editBook(_ controller: AnyObject, editBook: Book)
    func deleteBook(_ controller: AnyObject)
}
