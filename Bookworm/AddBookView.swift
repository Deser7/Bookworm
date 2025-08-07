//
//  AddBookView.swift
//  Bookworm
//
//  Created by Наташа Спиридонова on 06.08.2025.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = Genre.fantasy.description
    @State private var review = ""
    
    let genres = Genre.allCases
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0.description)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(
                            title: title.withDefault(BookDefaults.title),
                            author: author.withDefault(BookDefaults.author),
                            genre: genre.withDefault(BookDefaults.genre.description),
                            review: review.withDefault(BookDefaults.review),
                            rating: rating
                        )
                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add book")
        }
    }
}

#Preview {
    AddBookView()
}
