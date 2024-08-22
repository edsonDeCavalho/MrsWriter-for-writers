//
//  BookPageView.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 16/08/2024.
//

import SwiftUI
import SwiftData

import SwiftUI

struct BookPageView: View {
    @State var book: BookClass  // Make the book mutable
    @State private var texts: [TextClass] = [] // State to hold the fetched texts
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State private var showingDeleteConfirmation = false
    @State private var showingSaveToast = false // State to control toast visibility
    @Query private var textFromDataBase: [TextClass]
    
    // Reference to the view controller used for saving file
    @State private var viewController: UIViewController? = nil
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // ScrollView to handle the content
                ScrollView {
                    headerView
                    // Book details and number of texts
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Button(action: {
                                guard let viewController = viewController else { return }
                               
                                let list = fetchTexts(for: book.id.uuidString)
                                saveFile(to: list, defaultFileName: book.title, viewController: viewController)
                            }) {
                               HStack {
                                   Image(systemName: "square.and.arrow.up") // Replace with your desired system icon
                                   Text("export_button")
                               }
                               .padding() // Adds padding inside the button
                               .background(Color(hex: book.color)) // Sets the background color to the book's color
                               .foregroundColor(.white) // Sets the text and icon color to white
                               .cornerRadius(38) // Rounds the corners
                               .font(.system(size: 14, weight: .bold))
                               .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                        
                        Text("description")
                            .font(.headline)
                            .padding(.top)
                        
                        // Editable description
                        TextEditor(text: $book.descriptionBook)
                            .font(.body)
                            .frame(minHeight:100,maxHeight: 400) // Set a minimum height for the editor
                            .padding(4)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(8)
                            
                        VStack(spacing: 16) {
                            Text("chapittres")
                                .font(.headline)
                                .padding(.top)
                            
                            ForEach(texts.sorted(by: { $0.lastModificationDate > $1.lastModificationDate }), id: \.id) { text in
                                NavigationLink(destination: EditTextView(text: text)) {
                                    TextCardView(text: text)
                                        .padding(.horizontal, 2)
                                }
                                .buttonStyle(PlainButtonStyle())  // Removes the blue color and default button styling
                            }
                        }
                        .padding(.top)
                    }
                    .padding(.horizontal, 10)
                    Spacer()
                }
            }
            .edgesIgnoringSafeArea(.top) // Extends the header to the top of the screen
            .toolbar {
                // Save button in the toolbar
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: saveBook) {
                        Text("save")
                    }
                }
                // Delete button in the toolbar
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingDeleteConfirmation = true
                    }) {
                        Image(systemName: "trash.fill")
                    }
                }
            }
            .alert(isPresented: $showingDeleteConfirmation) {
                Alert(
                    title: Text("delete_book"),
                    message: Text("areyousure"),
                    primaryButton: .destructive(Text("delete")) {
                        deleteBook()
                    },
                    secondaryButton: .cancel()
                )
            }
            .overlay(
                Toast(message: NSLocalizedString("successfully_changes", comment: ""), isShowing: $showingSaveToast)
                                  .transition(.opacity)
                                  .animation(.easeInOut, value: showingSaveToast) // Apply animation to the transition
            )
            .onAppear {
                texts = fetchTexts(for: book.id.uuidString)
            }
            .onChange(of: book) { _ in
                texts = fetchTexts(for: book.id.uuidString)
            }
            // To make sure viewController is set
            .onAppear {
                if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let window = scene.windows.first {
                    viewController = window.rootViewController
                }
            }
        }
    }
    
    // Header view with color and centered title
    private var headerView: some View {
        ZStack {
            Color(hex: book.color)
                .frame(height: 300)
            
            // Editable title
            TextField("edit_title", text: $book.title)
                .font(.title)
                .foregroundColor(.white)
                .bold()
                .multilineTextAlignment(.center) // Center the text
                .padding(.horizontal, 40) // Add padding for easier editing
                .cornerRadius(10)
        }
    }
    
    // Function to handle save action
    private func saveBook() {
        do {
            try context.save()  // Save changes to the context
            showingSaveToast = true
            print("book_saved")
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Hide toast after 2 seconds
                showingSaveToast = false
            }
        } catch {
            print("Failed to save book: \(error.localizedDescription)")
        }
    }
    
    // Function to handle delete action
    private func deleteBook() {
        context.delete(book)
        
        do {
            try context.save()  // Save changes to the context
            print("book_deleted")
            dismiss()
        } catch {
            print("Failed to delete book: \(error.localizedDescription)")
        }
    }
    
    // Function to fetch texts related to the book
    private func fetchTexts(for bookId: String) -> [TextClass] {
        return textFromDataBase.filter { $0.book_id == bookId }
    }
}
#Preview {
    BookPageView(book: BookClass.previewBookClass)
}
