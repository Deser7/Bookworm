//
//  Book.swift
//  Bookworm
//
//  Created by Наташа Спиридонова on 06.08.2025.
//

import SwiftData

@Model
final class Book {
    var title: String
    var authhor: String
    var genre: String
    var review: String
    var rating: Int
    
    init(title: String, authhor: String, genre: String, review: String, rating: Int) {
        self.title = title
        self.authhor = authhor
        self.genre = genre
        self.review = review
        self.rating = rating
    }
}
