//
//  ContentView.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 27/07/2024.
//

import SwiftUI


struct ContentView: View {
    @State private var showingAlert: Bool = false
    @State private var navigateToCreateBook: Bool = false
    @State private var navigateToCreateFile: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                TabView {
                    HomeView().tabItem { Label("Home", systemImage: "text.book.closed") }
                    CreateNewText().tabItem { Label("Create", systemImage: "doc.fill.badge.plus") }
                    // CreateBook(book: BookClass.previewBookClass)
                }
                .navigationBarBackButtonHidden(true) // Ensure back button is hidden here
                
                if showingAlert {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showingAlert = false
                        }
                    PopUpCreationView(
                        isPresented: $showingAlert,
                        navigateToCreateBook: $navigateToCreateBook,
                        navigateToCreateFile: $navigateToCreateFile
                    )
                    .transition(.scale)
                }
                
                NavigationLink(destination: CreateANewBookView(), isActive: $navigateToCreateBook) { EmptyView() }
                NavigationLink(destination: CreateNewText(), isActive: $navigateToCreateFile) { EmptyView() }
            }
            .overlay(
                FloatingButtonCreateView(showingAlert: $showingAlert), // Use the floating button here
                alignment: .bottom
            )
        }
        .navigationBarBackButtonHidden(true) // Ensure the back button is hidden for the entire `ContentView`
    }
}

struct FloatingButtonCreateView: View {
    @Binding var showingAlert: Bool

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Button(action: {
                    showingAlert = true // Trigger the alert
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.white)
                        .background(Circle().fill(Color.blue))
                        .shadow(radius: 10)
                }
                .padding(.bottom, geometry.safeAreaInsets.bottom + 20) // Adjust padding to position above safe area
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
#Preview {
    ContentView()
}
