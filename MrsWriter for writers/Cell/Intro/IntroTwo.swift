//
//  IntroTwo.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 19/08/2024.
//

import SwiftUI
import SwiftData

struct IntroTwo: View {
    @State private var firstChapterName: String = ""
    var bookid : String = ""
    @Environment(\.modelContext) private var context
    @Query private var books: [BookClass]
    @State private var navigate = false // State variable to trigger navigation

    var body: some View {
     
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    // Prompt Text
                    Text("Intro2_nameofchapter")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, geometry.size.width * 0.1)
                    
                    Spacer(minLength: 10)
                    
                    // Text Field
                    TextField("Intro2_chapter", text: $firstChapterName)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal, geometry.size.width * 0.1)
                    
                    Spacer(minLength: 20)
                    
                    Button(action: {
                        // Call your function to create or retrieve the bookid
                        saveText()
                        navigate = true // Trigger navigation
                    }) {
                        Text(NSLocalizedString("Intro2_btncontinue", comment: ""))
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(28)
                            .padding(.horizontal, 100) // Adjust padding based on geometry
                    }
                    .padding(.top, 20)
                    
                    NavigationLink(destination: IntroTree(), isActive: $navigate) {
                        EmptyView() // Empty view as the label since the navigation is handled by the Button
                    }
                    
                    Spacer()
                    
                    // Image at the Bottom
                    Image("FoxBig") // Replace "FoxBig" with the actual image name
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.6) // Image width relative to screen size
                        .padding(.bottom, 10)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Full screen
                .background(Color.green)
                .edgesIgnoringSafeArea(.all) // Ignore safe area to make it full screen
            }
        
    }
    
    private func saveText() {
        // Save logic here
        let textToSave = TextClass(
            title: firstChapterName,
            text: "",
            book_id: bookid, // Assign the selected book's ID
            color: "#008000",
            lastModificationDate: Date()
        )
        if(textToSave.title.isEmpty){
            print("Nonte init note saved")
        }else{
            context.insert(textToSave)
        }
       
     print("textsavedinsert")
    }
}
// .navigationBarBackButtonHidden(true)
#Preview {
    IntroTwo(bookid:"0")
}
