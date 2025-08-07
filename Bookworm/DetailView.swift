//
//  DetailView.swift
//  Bookworm
//
//  Created by Наташа Спиридонова on 07.08.2025.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert  = false
    
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                
                Text(book.genre.uppercased())
                    .fontWeight(.black)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Удалить книгу", isPresented: $showingDeleteAlert) {
            Button("Удалить", role: .destructive,action: deleteBook)
            Button("Закрыть", role: .cancel) {}
        } message: {
            Text("Вы уверенны?")
        }
        .toolbar {
            Button("Удалить эту книгу?", systemImage: "trash") {
                showingDeleteAlert = true
            }
        }
    }
    
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Book.self, configurations: config)
    let example = Book(
        title: "Тестовая книга",
        author: "Тестовый автор",
        genre: "Фантастика",
        review: "Это лучшая книга!",
        rating: 4
    )
    
    DetailView(book: example)
        .modelContainer(container)
}
