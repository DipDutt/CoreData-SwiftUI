//
//  ContentView.swift
//  CoreDataBooKWrom
//
//  Created by Dip Dutt on 6/5/23.
//

import SwiftUI


struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)
    ]) var books:FetchedResults<Book>
    @State var isshowing:Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingview(Rating: book.rating)
                            VStack(alignment:.leading) {
                                Text(book.title ?? "unknown")
                                    .font(.headline)
                             
                                Text(book.author ?? "unknown")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: delete)
            }
                .navigationTitle("BookWrom")
           
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isshowing.toggle()
                        } label: {
                            Label("AddBook", systemImage:"plus")
                        }
                    }
                }
                .sheet(isPresented: $isshowing) {
                    AddBook()
            }
        }
    }
    
    func delete(at offset :IndexSet) {
        for offsets in offset {
            let book = books[offsets]
            moc.delete(book)
        }
        try?moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
