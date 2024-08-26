//
//  EditTextView.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 27/07/2024.
//

import SwiftUI
import SwiftData

struct EditTextView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State var text: TextClass  // Ensure this is mutable if you're editing an existing object
    @State private var showingSaveToast = false // State to show a toast message
    @State private var showingDeleteConfirmation = false // State to control the delete confirmation alert
    @State private var showingBookSelection = false // State to show the book selection sheet
    @Query private var books: [BookClass] // Assuming you have a list of books available for selection

    var body: some View {
        NavigationStack {
            ZStack {
                VStack(alignment: .leading, spacing: 1) {
                    TextField("EditText_page_entertile", text: $text.title)
                        .background(Color.clear)
                        .padding(.horizontal)
                        .font(.system(size: 40, weight: .bold))
                    
                    ZStack(alignment: .topLeading) {
                        if text.text.isEmpty {
                            Text("Enter_your_text")
                                .foregroundColor(.gray)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                        }

                        TextEditor(text: $text.text)
                            .background(Color.clear) // Make background transparent
                            .padding(10)
                            .frame(maxWidth: .infinity, maxHeight: .infinity) // Take up available space
                    }

                    Spacer()
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("").font(.system(size: 20, weight: .bold))
                    }
                    // Gear button to open book selection sheet
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: { showingBookSelection = true }) {
                            Image(systemName: "gearshape")
                        }
                    }
                    // Delete button in the toolbar
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: { showingDeleteConfirmation = true }) {
                            Image(systemName: "trash.fill")
                        }
                    }
                }
                
                // Floating Button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            saveText()  // Call the save function
                        }) {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        .padding()
                    }
                }
            }
            .overlay(
                ToastToShoose(
                    message: NSLocalizedString("changessaved", comment: "Changes saved successfully"),
                    isShowing: $showingSaveToast
                ))
                .transition(.opacity)
                .animation(.easeInOut(duration: 1.5), value: showingSaveToast)
            .alert(isPresented: $showingDeleteConfirmation) {
                Alert(
                    title: Text("deletedText"),
                    message: Text("areyousure"),
                    primaryButton: .destructive(Text("delete")) {
                        deleteText()  // Perform the deletion if confirmed
                    },
                    secondaryButton: .cancel()
                )
            }
            .sheet(isPresented: $showingBookSelection) {
                VStack {
                    Text("movetbook")
                        .font(.headline)
                        .padding()

                    if(books.isEmpty){
                        Text(NSLocalizedString("NoBooksMessage", comment: "Message when there are no books"))
                                           .padding()
                                           .font(.title3)
                    }else{
                        List(books) { book in
                            Button(action: {
                                text.book_id = book.id.uuidString  // Update the book associated with the text
                                text.color = book.color  // Update the book associated with the text
                                saveText()  // Save the changes
                                showingBookSelection = false  // Dismiss the sheet
                            }) {
                                Text(book.title)
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
    
    private func saveText() {
        do {
            try context.save()  // Save changes to the context
            showingSaveToast = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                showingSaveToast = false
            }
            print("Text saved successfully!")
        } catch {
            print("Failed to save text: \(error.localizedDescription)")
        }
    }

    private func deleteText() {
        context.delete(text)
        do {
            try context.save()  // Save changes to the context
            print("Text deleted!")
            dismiss()
        } catch {
            print("Failed to delete text: \(error.localizedDescription)")
        }
    }
}
#Preview {
    EditTextView(text: TextClass.previewTextClass)
}
