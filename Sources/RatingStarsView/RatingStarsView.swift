//
//  SwiftUIView.swift
//  
//
//  Created by Семен Предыбайло on 28.11.2023.
//

import SwiftUI

//struct ContentView: View {
//    @State private var rating: Double = 3.83
//
//    var body: some View {
//        VStack {
//            Text("Rating: \(rating, specifier: "%.2f")")
//                .font(.title)
//                .padding(.bottom, 20)
//            
//            RatingStarsView(rating: rating, isAnimated: true) // Можно изменить на isAnimated: false, чтобы отключить анимацию
//        }
//    }
//}

struct RatingStarsView: View {
    var rating: Double {
        didSet {
            rating = min(max(rating, 0.0), 5.0)
        }
    }
    var isAnimated: Bool = false

    var body: some View {
        HStack {
            ForEach(0..<5, id: \.self) { index in
                StarView(cornerRadius: 1, fillPercent: min(1.0, max(0.0, rating - Double(index))))
                    .frame(width: 30, height: 30)
                    .foregroundColor(.gray)
                    .overlay(
                        StarView(cornerRadius: 1, fillPercent: 1)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.yellow)
                            .mask(
                                Rectangle()
                                    .frame(width: 30 * CGFloat(min(1.0, max(0.0, rating - Double(index)))), height: 30)
                                    .offset(x: index < Int(rating) ? 0 : -30 * CGFloat(1.0 - min(1.0, max(0.0, rating - Double(index)))), y: 0)
                            )
                    )
                    .animation(isAnimated ? .easeInOut(duration: 1.5).delay(Double(index) * 0.3) : nil, value: rating)
            }
        }
    }
}

#Preview {
    RatingStarsView(rating: 3.83, isAnimated: true)
}
