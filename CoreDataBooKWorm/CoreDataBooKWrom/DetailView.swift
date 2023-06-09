//
//  DetailView.swift
//  CoreDataBooKWrom
//
//  Created by Dip Dutt on 7/5/23.
//

import SwiftUI

struct DetailView: View {
    let book:Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment:.bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x:-5, y:-5)
                    
            }
            
            Text(book.author ?? "Unknown")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "unKnown")
            
            
            ratingView(Rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "Unknown")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

