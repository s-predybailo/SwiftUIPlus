# SwiftUIPlus

## Overview
SwiftUIPlus is a growing collection of reusable and versatile SwiftUI components designed to accelerate iOS and macOS app development. This package aims to provide high-quality, customizable UI elements that enhance the user experience and streamline the UI development process.

## Components
Currently, the package includes the following components:
- `RatingStarsView`: A customizable star rating view for user ratings and reviews.

## Installation
### Swift Package Manager
You can add SwiftUIPlus to your project via Swift Package Manager. Just use the following URL to add it as a dependency: `https://github.com/s-predybailo/SwiftUIPlus`

## Usage
### RatingStarsView
```swift
import SwiftUI
import SwiftUIPlus

struct ContentView: View {
    @State private var rating: Double = 3.5

    var body: some View {
        VStack {
            RatingStarsView(rating: rating)
        }
    }
}
