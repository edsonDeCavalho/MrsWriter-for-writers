//
//  BookClass.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 12/08/2024.
//

import Foundation
import SwiftData
import UIKit
import SwiftUI

@Model
class BookClass: Identifiable {
    let id: UUID
    var title: String
    var descriptionBook: String
    var color: String
    var type: String
    var lastModificationDate: Date
    
    // Initializer to set up all properties
    init(id: UUID = UUID(), title: String, descriptionBook: String, color: String, type: String, lastModificationDate: Date) {
        self.id = id
        self.title = title
        self.descriptionBook = descriptionBook
        self.color = color
        self.type = type
        self.lastModificationDate = lastModificationDate
    }
}



extension BookClass {
    
    static let previewBookClass = BookClass(
        title: "Swift Programming",
        descriptionBook: "A comprehensive guide to Swift programming.",
        color: "#a10cf0",
        type: "Fiction",
        lastModificationDate: Date()
    )
    
    static let previewBooksClass = [
        BookClass(
            title: "Swift Programming",
            descriptionBook: "A comprehensive guide to Swift programming.",
            color: "#ae360d",
            type: "Fiction",
            lastModificationDate: Date()
        ),
        BookClass(
            title: "The Great Gatsby",
            descriptionBook: "A classic novel set in the 1920s.",
            color: "#ae360d",
            type: "Fiction",
            lastModificationDate: Date()
        ),
        BookClass(
            title: "Steve Jobs Biography",
            descriptionBook: "The life of Steve Jobs, the co-founder of Apple.",
            color: "#ff5733",
            type: "Non-fiction",
            lastModificationDate: Date()
        ),
        BookClass(
            title: "Introduction to History",
            descriptionBook: "A look at major historical events.",
            color: "#7bf00c",
            type: "Non-fiction",
            lastModificationDate: Date()
        ),
        BookClass(
            title: "Mystery of the Blue Train",
            descriptionBook: "A thrilling mystery novel.",
            color: "#0cf09a",
            type: "Fiction",
            lastModificationDate: Date()
        )
    ]
}

extension BookClass {
    func createTextFile() -> URL? {
        // Prepare the text content
        let content = """
        Title: \(title)
        Description: \(descriptionBook)
        Color: \(color)
        Type: \(type)
        Last Modified: \(lastModificationDate)
        """

        // Create a temporary file URL
        let fileManager = FileManager.default
        guard let tempDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        let fileURL = tempDir.appendingPathComponent("\(title).txt")
        
        do {
            // Write the content to the file
            try content.write(to: fileURL, atomically: true, encoding: .utf8)
            return fileURL
        } catch {
            print("Error writing file: \(error.localizedDescription)")
            return nil
        }
    }
}
