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
                ListOfBooks(books: BookClass.previewBooksClass)
                Spacer()
                ListOfTexte(textes: TextClass.previewTextsClass)
            }
            .navigationTitle("welcomeback")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        print("Icon tapped on the left side")
                    }) {
                        Image("Logoapp")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Icon tapped in DetailView")
                    }) {
                        Image(systemName: "book.fill")
                    }
                }
            }
            .navigationBarBackButtonHidden(true) // Hide the back button
        }
        .navigationBarBackButtonHidden(true) // Ensure back button is hidden at all levels
    }
}

#Preview {
    HomeView()
}
