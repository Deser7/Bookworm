//
//  RatingView.swift
//  Bookworm
//
//  Created by Наташа Спиридонова on 07.08.2025.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            label.isEmpty == false
            ? Text(label)
            : nil
            
            ForEach(1...maximumRating, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
        }
        .buttonStyle(.plain)
    }
    
    func image(for number: Int) -> Image {
        number > rating
        ? offImage ?? onImage
        : onImage
    }
}

#Preview {
    RatingView(rating: .constant(4))
}
