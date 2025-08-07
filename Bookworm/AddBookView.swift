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
                    TextField("Название книги", text: $title)
                    TextField("Имя автора", text: $author)
                    
                    Picker("Жанр", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0.description)
                        }
                    }
                }
                
                Section("Напишите отзыв") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Сохранить") {
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
            .navigationTitle("Добавить книгу")
        }
    }
}

#Preview {
    AddBookView()
}
