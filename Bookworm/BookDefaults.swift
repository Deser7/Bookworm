//
//  AddBookViewModel.swift
//  Bookworm
//
//  Created by Наташа Спиридонова on 07.08.2025.
//

import Foundation

enum Genre: CustomStringConvertible, CaseIterable {
    case fantasy
    case horror
    case kids
    case mistery
    case romance
    case poetry
    case thriller
    
    var description: String {
        switch self {
        case .fantasy: "Фантастика"
        case .horror: "Ужасы"
        case .kids: "Детское"
        case .mistery: "Мистика"
        case .romance: "Романтика"
        case .poetry: "Поэзия"
        case .thriller: "Триллер"
        }
    }
}

extension String {
    func withDefault(_ defaultValue: String) -> String {
        let trimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty ? defaultValue : trimmed
    }
}

struct BookDefaults {
    static let title = "Без названия"
    static let author = "Неизвестный автор"
    static let genre: Genre = .fantasy
    static let review = "Отзыв отсутствует..."
    
}
