//
//  BookStore.swift
//  BookStore
//
//  Created by user192416 on 3/5/21.
//

import Foundation

class BookStore {
    var bookList: [Book] = []
    
    init() {
        var newBook = Book()
        newBook.title = "A Game of Thrones"
        newBook.author = "George R.R. Martin"
        newBook.imageURL = URL(string: "https://cdna.artstation.com/p/assets/images/images/009/079/810/large/robert-simon-got6-dragonz009.jpg")
        newBook.description = """
        The first volume in Martin's first fantasy saga, A Song of Ice and Fire, combines intrigue, action, romance, and mystery in a family saga. The family is the Starks of Winterfell, a society in crisis due to climatic change that has created decades-long seasons, and a society almost without magic but with human perversity abundant and active.
        """
        bookList.append(newBook)
        
        newBook = Book()
        newBook.title = "A Clash of Kings"
        newBook.author = "George R.R. Martin"
        newBook.imageURL = URL(string: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/534504ce-24a3-4b95-8790-90b7f0541483/d90bdr1-444d3479-a46e-4c2b-bb6d-041d5df0a7cb.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvNTM0NTA0Y2UtMjRhMy00Yjk1LTg3OTAtOTBiN2YwNTQxNDgzXC9kOTBiZHIxLTQ0NGQzNDc5LWE0NmUtNGMyYi1iYjZkLTA0MWQ1ZGYwYTdjYi5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.ed4ZH6mVJx-fUlktaf0JqLWhmodGgWBIHnGO9BjU6ME")
        newBook.description = """
        How does he do it? George R.R. Martin's high fantasy weaves a spell sufficient to seduce even those who vowed never to start a doorstopper fantasy series again (the first book--A Game of Thrones--runs over 700 pages). A Clash of Kings is longer and even more grim, but Martin continues to provide compelling characters in a vividly real world.
        """
        bookList.append(newBook)
                
        newBook = Book()
        newBook.title = "Ready Player One"
        newBook.author = "Ernest Cline"
        newBook.imageURL = URL(string: "https://i.guim.co.uk/img/media/e5b0b89d36dabf132aca5439a7f56012c7773d19/0_0_4000_2401/master/4000.jpg?width=700&quality=85&auto=format&fit=max&s=3ee3d0ee6d9edd01e53bd8ad381c4681")
        newBook.description = """
        Ready Player One is a 2011 science fiction novel, and the debut novel of American author Ernest Cline. The story, set in a dystopia in 2045, follows protagonist Wade Watts on his search for an Easter egg in a worldwide virtual reality game, the discovery of which would lead him to inherit the game creator's fortune.
        """
        bookList.append(newBook)
        
        newBook = Book()
        newBook.title = "Nineteen Eighty-Four"
        newBook.author = "George Orwell"
        newBook.imageURL = URL(string: "https://cdna.artstation.com/p/assets/images/images/009/443/838/large/wu-yi-1.jpg")
        newBook.description = """
        Nineteen Eighty-Four: A Novel, often published as 1984, is a dystopian social science fiction novel by English novelist George Orwell. It was published on 8 June 1949 by Secker & Warburg as Orwell's ninth and final book completed in his lifetime.
        """
        bookList.append(newBook)
        
        newBook = Book()
        newBook.title = "Metro 2033"
        newBook.author = "Dmitry Glukhovsky"
        newBook.imageURL = URL(string: "https://www.mobygames.com/images/promo/original/1519735162-4232390681.jpg")
        newBook.description = """
        Metro 2033 is a 2002 post-apocalyptic fiction novel by Russian author Dmitry Glukhovsky. It is set within the Moscow Metro, where the last survivors hide after a global nuclear holocaust. It has been followed by two sequels, Metro 2034 and Metro 2035, and spawned the Metro media franchise.
        """
        bookList.append(newBook)
        
        bookList = bookList.sorted(by: {$0.title < $1.title})
    }
}
