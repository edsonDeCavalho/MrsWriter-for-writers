//
//  TextStruct.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 10/08/2024.
//

import Foundation
import SwiftUI


struct TextStruct: Identifiable {
    let id = UUID()
    let title: String
    let text: String
    let book_id : String
    let color: Color
    let lastModificationDate: Date
}


#if DEBUG

extension TextStruct {
    
    static let previewTextStruct = TextStruct(
        title: "Introduction to Swift",
        text: "Swift is a powerful and intuitive programming language for iOS, macOS, watchOS, and tvOS.",
        book_id: "1",
        color: .blue,
        lastModificationDate: Date()
    )
    
    static let previewTextsStruct = [
        TextStruct(
            title: "Introduction to Swift",
            text: "Swift is a powerful and intuitive programming language for iOS, macOS, watchOS, and tvOS.",
            book_id: "1",
            color: .blue,
            lastModificationDate: Date()
        ),
        TextStruct(
            title: "Getting Started with SwiftUI",
            text: "SwiftUI provides views, controls, and layout structures for declaring your app’s user interface.",
            book_id: "2",
            color: .green,
            lastModificationDate: Date()
        ),
        TextStruct(
            title: "Advanced Swift",
            text: "Delve into the advanced features of Swift, including closures, protocols, and generics.",
            book_id: "1",
            color: .purple,
            lastModificationDate: Date()
        ),
        TextStruct(
            title: "The Great Gatsby Overview",
            text: "The Great Gatsby is a story of the wealthy Jay Gatsby and his love for Daisy Buchanan.",
            book_id: "3",
            color: .orange,
            lastModificationDate: Date()
        ),
        TextStruct(
            title: "Steve Jobs' Innovations",
            text: "Steve Jobs was a visionary who revolutionized technology with products like the iPhone and Mac.",
            book_id: "4",
            color: .gray,
            lastModificationDate: Date()
        )
    ]
}

#endif
