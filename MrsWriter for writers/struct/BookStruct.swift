//
//  Book.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 10/08/2024.
//

import Foundation
import SwiftUI

struct BookStruct: Identifiable {
    let id = UUID()
    let title: String
    let descriptionBook: String
    let color : Color
    let type :  String
    let lastModificationDate : Date
}

let books: [BookStruct] = [
   
]

    #if DEBUG

    extension BookStruct {
        
        static let previewBookStruct =  BookStruct(
            title: "Swift Programming",
            descriptionBook: "A comprehensive guide to Swift programming.",
            color: .blue,
            type: "Fiction",
            lastModificationDate: Date()
        )
        
        static let previewBooksStruct = [
            BookStruct(
                title: "Swift Programming",
                descriptionBook: "A comprehensive guide to Swift programming.",
                color: .blue,
                type: "Fiction",
                lastModificationDate: Date()
            ),
            BookStruct(
                title: "The Great Gatsby",
                descriptionBook: "A classic novel set in the 1920s.",
                color: .green,
                type: "Fiction",
                lastModificationDate: Date()
            ),
            BookStruct(
                title: "Steve Jobs Biography",
                descriptionBook: "The life of Steve Jobs, the co-founder of Apple.",
                color: .gray,
                type: "Fiction",
                lastModificationDate: Date()
            ),
            BookStruct(
                title: "Introduction to History",
                descriptionBook: "A look at major historical events.",
                color: .red,
                type: "Fiction",
                lastModificationDate: Date()
            ),
            BookStruct(
                title: "Mystery of the Blue Train",
                descriptionBook: "A thrilling mystery novel.",
                color: .purple,
                type: "Fiction",
                lastModificationDate: Date()
            )
        ]
    }

    #endif
