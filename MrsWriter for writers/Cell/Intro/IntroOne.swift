//
//  IntroOne.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 19/08/2024.
//

import SwiftUI
import SwiftData

struct IntroOne: View {
    @State private var bookName: String = ""
    @Environment(\.modelContext) private var context
    @Query private var books: [BookClass]
    @State private var bookid: String?
    @State private var navigateToIntroTwo = false // State variable to trigger navigation
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    // Prompt Text
                    Text("Intro1")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, geometry.size.width * 0.1)
                    
                    Spacer(minLength: 20)
                    
                    // Text Field
                    TextField("Intro2_BookName", text: $bookName)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal, geometry.size.width * 0.1)
                    
                    Spacer(minLength: 20)
                    
                    // Continue Button
                    Button(action: {
                        let newBookId = createBook()
                        bookid = newBookId.uuidString
                        navigateToIntroTwo = true // Trigger navigation
                    }) {
                        Text(NSLocalizedString("Intro2_btncontinue", comment: ""))
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(28)
                            .padding(.horizontal, UIDevice.current.userInterfaceIdiom == .pad ? 200 : 100) // Adjust padding based on device
                    }
                    .padding(.top, 20)
                    
                    // NavigationLink that triggers based on the navigate state
                    NavigationLink(
                        destination: IntroTwo(bookid: bookid ?? ""),
                        isActive: $navigateToIntroTwo
                    ) {
                        EmptyView() // Empty view as the label since the navigation is handled by the Button
                    }
                    
                    Spacer()
                    
                    // Image at the Bottom
                    Image("FoxBig") // Replace "FoxBig" with the actual image name
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * (UIDevice.current.userInterfaceIdiom == .pad ? 0.4 : 0.6)) // Adjust image width for iPad
                        .padding(.bottom, 10)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Full screen
                .background(Color.green)
                .edgesIgnoringSafeArea(.all) // Ignore safe area to make it full screen
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private func createBook() -> UUID {
        // Logic to create a new book
        let booknew = BookClass(
            title: bookName,
            descriptionBook: "",
            color: "#008000",
            type: "Fiction",
            lastModificationDate: Date()
        )
        if bookName.isEmpty {
            print("Book not created")
        } else {
            context.insert(booknew)
            print("Book Created: \(booknew)")
        }
        
        return booknew.id
    }
}

#Preview {
    IntroOne()
}
