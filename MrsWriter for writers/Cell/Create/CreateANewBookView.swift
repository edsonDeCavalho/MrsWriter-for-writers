//
//  CreateANewBookView.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 05/08/2024.
//
import CoreData
import UIKit
import SwiftUI
import SwiftData

struct CreateANewBookView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var selectedColor: Color = .red
    @State private var selectedType: String = "Fiction"
    
    @Environment(\.modelContext) private var context
    @Query private var books: [BookClass]
    
    @State private var showConfirmationAlert = false
    @State private var navigateToHome = false
    @State private var createdBook: BookClass?
    
    let bookTypes = ["fic", "non-fic", "biogra", "fanty", "science", "mis"]
    let colors: [Color] = [.red, .green, .blue, .yellow, .orange, .purple, .gray]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("book_title")) {
                    TextField("Enter_book_title", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Section(header: Text("book_description")) {
                    TextEditor(text: $description)
                        .frame(height: 100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                }
                
                Section(header: Text("SelectBookcolor")) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(colors, id: \.self) { color in
                                Circle()
                                    .fill(color)
                                    .frame(width: 40, height: 40)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.black, lineWidth: selectedColor == color ? 3 : 0)
                                    )
                                    .onTapGesture {
                                        selectedColor = color
                                    }
                            }
                        }.padding()
                    }
                }
                
                Section(header: Text(NSLocalizedString("selectbooktype", comment: "Select book type"))) {
                    Picker(NSLocalizedString("booktype", comment: "Book type"), selection: $selectedType) {
                        ForEach(bookTypes, id: \.self) { bookTypeKey in
                            Text(NSLocalizedString(bookTypeKey, comment: ""))
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section {
                    Button(action: createBook) {
                        Text("createbook")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .background(Color.clear)
            }
            .navigationTitle("createnewbook")
            .listStyle(GroupedListStyle())
            .alert(isPresented: $showConfirmationAlert) {
                Alert(
                    title: Text(NSLocalizedString("livrecree", comment: "Book created")),
                    message: Text(NSLocalizedString("thebook", comment: "The book has been created")),
                    dismissButton: .default(Text("OK"), action: {
                        // Dismiss the current view and navigate to HomeView
                        presentationMode.wrappedValue.dismiss()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            navigateToHome = true
                        }
                    })
                )
            }
            .background(
                NavigationLink(
                    destination: HomeView(),
                    isActive: $navigateToHome,
                    label: { EmptyView() }
                ).hidden()
            )
        }
    }
    
    private func createBook() {
        // Logic to create a new book
        let booknew = BookClass(
            title: title,
            descriptionBook: description,
            color: hexString(from: selectedColor),
            type: selectedType,
            lastModificationDate: Date()
        )
        context.insert(booknew)
        createdBook = booknew
        showConfirmationAlert = true
        print("Book Created: \(booknew)")
    }
}


#Preview {
    CreateANewBookView()
}
