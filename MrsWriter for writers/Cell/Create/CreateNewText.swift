import SwiftUI
import SwiftData

import SwiftUI

struct CreateNewText: View {
    @State private var noteTitle: String = ""
    @State private var noteText: String = ""
    @Environment(\.modelContext) private var context
    @Query private var books: [BookClass]
    @State private var showingSaveToast = false
    @State private var showingDeleteConfirmation = false
    @State private var showingBookSelection = false // State to control book selection sheet
    @State private var selectedBook: BookClass = BookClass(title: "", descriptionBook: "", color: "#0000", type: "fanty", lastModificationDate: Date())  // State to track selected book
    @State private var isTextSaved = false // Track if the text is saved

    var body: some View {
        NavigationStack {
            ZStack {
                VStack(alignment: .leading, spacing: 1) {
                    TextField("chaptertitre", text: $noteTitle)
                        .background(Color.clear)
                        .padding(.horizontal)
                        .font(.system(size: 40, weight: .bold))
                    
                   
                    ZStack(alignment: .topLeading) {
                        if noteText.isEmpty {
                            Text("enteryoutext")
                                .foregroundColor(.gray)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                        }

                        TextEditor(text: $noteText)
                            .background(Color.clear) // Make background transparent
                            .padding(10)
                            .frame(maxWidth: .infinity, maxHeight: .infinity) // Take up available space
                    }

                    Spacer()
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("newchapter") .font(.system(size: 20, weight: .bold))
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: { 
                            showingBookSelection = true
                        }) {
                            Image(systemName: "gearshape")
                        }
                    }
                    
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        Button(action: {
//                            showingDeleteConfirmation = true
//                        }) {
//                            Image(systemName: "trash.fill")
//                        }
//                    }
                    
                    if isTextSaved { // Conditionally display the "Save" button
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("saveenre") {
                                // Action when the saved button is pressed, if any
                            }
                            .foregroundColor(.green) // Optional: Make the text green to indicate it's saved
                        }
                    }
                }
                
                // Floating Button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            if selectedBook.title != "" { // Check if a book has already been selected
                                saveText() // Directly save the text
                            } else {
                                showingBookSelection = true // Show book selection sheet
                            }
                        }) {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.blue)
                        }
                        .padding()
                    }
                }
            }
            .alert(isPresented: $showingDeleteConfirmation) {
                Alert(
                    title: Text("deletedText"),
                    message: Text("Are you sure you want to delete this text?"),
                    primaryButton: .destructive(Text("Delete")) {
                        deleteText()
                    },
                    secondaryButton: .cancel()
                )
            }
            .sheet(isPresented: $showingBookSelection) {
                // Book Selection Sheet
                VStack {
                    Text("selectabook")
                        .font(.headline)
                        .padding()

                    List(books) { book in
                        Button(action: {
                            selectedBook = book
                            saveText()
                            showingBookSelection = false // Close sheet after selection
                        }) {
                            Text(book.title)
                        }
                    }
                }
                .padding()
            }
            .overlay(
                ToastToShoose(message: NSLocalizedString("changessaved", comment: ""), isShowing: $showingSaveToast)
                                  .transition(.opacity)
                                  .animation(.easeInOut(duration: 1.5), value: showingSaveToast) // Apply animation to the transition
            )
        }
    }

    // Function to handle save action
    private func saveText() {
        let book: BookClass = selectedBook

        // Save logic here
        let textToSave = TextClass(
            title: noteTitle,
            text: noteText,
            book_id: book.id.uuidString, // Assign the selected book's ID
            color: book.color,
            lastModificationDate: Date()
        )
        if(textToSave.title.isEmpty){
            textToSave.title="emptytitle"
        }
        
        context.insert(textToSave)
        print("textsavedinsert")

        isTextSaved = true // Mark the text as saved
        showingSaveToast = true // Show the save toast
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showingSaveToast = false
        }
    }

    // Function to handle delete action
    private func deleteText() {
        // Delete logic here
        print("Text deleted")
    }
}

// Custom Toast view
struct ToastToShoose: View {
    var message: String
    @Binding var isShowing: Bool

    var body: some View {
        if isShowing {
            VStack {
                Spacer()
                Text(message)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.bottom, 20)
            }
            .transition(.opacity)
            .animation(.easeInOut, value: isShowing)
        } else {
            EmptyView()
        }
    }
}


#Preview {
    CreateNewText()
}
