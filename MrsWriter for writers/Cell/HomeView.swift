//
//  BooksView.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 27/07/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var isNavigating: Bool = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // List of books
                    ListOfBooks(books: BookClass.previewBooksClass)

                    // Spacer to push the next content down
                    Spacer(minLength: 20)

                    // List of texts
                    ListOfTexte(textes: TextClass.previewTextsClass)
                }
                .padding(.bottom, 5) // Add padding to the bottom if needed
                .padding(.top, 80) // Add padding to the bottom if needed
            }
            .edgesIgnoringSafeArea(.top) // Ignore the top safe area to remove the space
            .navigationTitle("Welcome Back") // Ensure title is set correctly
        }
    }
}

#Preview {
    HomeView()
}
