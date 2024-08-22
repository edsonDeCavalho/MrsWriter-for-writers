//
//  TextClass.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 12/08/2024.
//

import Foundation
import SwiftData
import UIKit
import SwiftUI

@Model
class TextClass : Identifiable{
    var title: String
    var text: String
    var book_id: String
    var color: String
    var lastModificationDate: Date
    
    init(title: String, text: String, book_id: String, color: String, lastModificationDate: Date) {
        self.title = title
        self.text = text
        self.book_id = book_id
        self.color = color
        self.lastModificationDate = lastModificationDate
    }
    
}



extension TextClass {
    
    static let previewTextClass = TextClass(
        title: "Sample Title",
        text: "This is a sample text for the preview of TextClass.",
        book_id: "1",
        color: "#a10cf0",
        lastModificationDate: Date()
    )
    
    static let previewTextsClass = [
        TextClass(
            title: "SwiftUI Basics",
            text: "A detailed introduction to building interfaces with SwiftUI.",
            book_id: "1",
            color: "#ae360d",
            lastModificationDate: Date()
        ),
        TextClass(
            title: "Advanced Combine",
            text: "Deep dive into the Combine framework for reactive programming.",
            book_id: "2",
            color: "#ff5733",
            lastModificationDate: Date()
        ),
        TextClass(
            title: "Networking in Swift",
            text: "Comprehensive guide to networking using URLSession and other APIs.",
            book_id: "3",
            color: "#7bf00c",
            lastModificationDate: Date()
        ),
        TextClass(
            title: "Core Data Essentials",
            text: "Learn the essentials of Core Data, Apple's object graph and persistence framework.",
            book_id: "4",
            color: "#0cf09a",
            lastModificationDate: Date()
        ),
        TextClass(
            title: "Concurrency in Swift",
            text: "Explore how to handle concurrency with Grand Central Dispatch and async/await.",
            book_id: "5",
            color: "#1d75f0",
            lastModificationDate: Date()
        )
    ]
}

