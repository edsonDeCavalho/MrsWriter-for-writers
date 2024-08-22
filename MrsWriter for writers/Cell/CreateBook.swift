//
//  CreateBook.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 17/08/2024.
//

import SwiftUI
import UIKit



// Use the ShareSheet in a SwiftUI view
struct CreateBook: View {
    @State private var showingShareSheet = false
    @State private var fileURL: URL?

    var book: BookClass

    var body: some View {
        VStack {
            Button("createsharetext") {
                // Generate the text file URL
                fileURL = book.createTextFile()
                
                // Trigger the ShareSheet
                if fileURL != nil {
                    showingShareSheet = true
                }
            }
        }
        .sheet(isPresented: $showingShareSheet) {
            if let fileURL = fileURL {
                ShareSheet(activityItems: [fileURL], applicationActivities: nil)
            }
        }
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? // Allow custom activities

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // No update code needed for this use case
    }
}

#Preview {
    CreateBook(book: BookClass.previewBookClass)
}
