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
    let colors: [Color] = [.red, .green, .yellow, .orange, .purple, .gray]
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("book_title")) {
                    TextField("Enter book title", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(.system(size: adaptiveFontSize(isTitle: true)))
                }
                
                Section(header: Text("book_description")) {
                    TextEditor(text: $description)
                        .frame(height: 150) // Increased height for iPad
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                        .font(.system(size: adaptiveFontSize(isTitle: false)))
                }
                
                Section(header: Text("Select Book Color")) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(colors, id: \.self) { color in
                                Circle()
                                    .fill(color)
                                    .frame(width: 50, height: 50) // Adjusted size for iPad
                                    .overlay(
                                        Circle()
                                            .stroke(Color.black, lineWidth: selectedColor == color ? 3 : 0)
                                    )
                                    .onTapGesture {
                                        selectedColor = color
                                    }
                            }
                        }
                        .padding()
                    }
                }
                
                Section(header: Text("Select Book Type")) {
                    Picker("Book Type", selection: $selectedType) {
                        ForEach(bookTypes, id: \.self) { bookTypeKey in
                            Text(NSLocalizedString(bookTypeKey, comment: ""))
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .font(.system(size: adaptiveFontSize(isTitle: false))) // Adjust font size
                }
                
                Section {
                    Button(action: createBook) {
                        Text("Create Book")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .font(.system(size: adaptiveFontSize(isTitle: false))) // Adjust font size
                    }
                }
                .background(Color.clear)
            }
            .navigationTitle("Create New Book")
            .listStyle(GroupedListStyle())
            .alert(isPresented: $showConfirmationAlert) {
                Alert(
                    title: Text(NSLocalizedString("Book Created", comment: "Book created")),
                    message: Text(NSLocalizedString("The book has been created", comment: "The book has been created")),
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
    
    private func adaptiveFontSize(isTitle: Bool) -> CGFloat {
        let baseSize: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? (isTitle ? 24 : 18) : (isTitle ? 18 : 14)
        return baseSize
    }
    
}


#Preview {
    CreateANewBookView()
}
