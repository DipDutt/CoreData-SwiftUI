//
//  AddBook.swift
//  CoreDataBooKWrom
//
//  Created by Dip Dutt on 7/5/23.
//

import SwiftUI

struct AddBook: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title:String = ""
    @State private var author:String = ""
    @State private var genre:String = ""
    @State private var review:String = ""
    @State private var rating:Int = 0
    let genres = ["Fantasy","Horror","Kids","Mystery","Romance", "Poetry","Mythological"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of the Book", text: $title)
                    TextField("Name of the Author", text: $author)
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                    ratingView(Rating: $rating)
                    
                }
            header: {
            Text("Write a review")
            }
                
                Section {
                    Button("AddBook") {
                        
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.author = author
                        newBook.title = title
                        newBook.review = review
                        newBook.genre = genre
                        newBook.rating = Int16(rating)
                        try? moc.save()
                        dismiss()
                        
                    }
                }
                
            }
            .navigationTitle("AddBook")
        }
    }
}



struct AddBook_Previews: PreviewProvider {
    static var previews: some View {
        AddBook()
    }
}
