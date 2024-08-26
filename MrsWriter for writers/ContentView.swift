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
        // Use a conditional layout for iPhone and iPad
        NavigationStack {
            Group {
                if UIDevice.current.userInterfaceIdiom == .pad {
                    MainContentView(showingAlert: $showingAlert,
                                    navigateToCreateBook: $navigateToCreateBook,
                                    navigateToCreateFile: $navigateToCreateFile)
                    
                } else {
                    NavigationView {
                        MainContentView(showingAlert: $showingAlert,
                                        navigateToCreateBook: $navigateToCreateBook,
                                        navigateToCreateFile: $navigateToCreateFile)
                    }
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

struct MainContentView: View {
    @Binding var showingAlert: Bool
    @Binding var navigateToCreateBook: Bool
    @Binding var navigateToCreateFile: Bool

    var body: some View {
        ZStack {
            TabView {
                HomeView()
                    .tabItem { Label("Home", systemImage: "text.book.closed") }
                CreateNewText()
                    .tabItem { Label("Create", systemImage: "doc.fill.badge.plus") }
            }
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
            .navigationBarBackButtonHidden(true)
            
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
            FloatingButtonCreateView(showingAlert: $showingAlert),
            alignment: .bottom
        )
    }
}

struct SidebarView: View {
    var body: some View {
        List {
            NavigationLink(destination: HomeView()) {
                Label("Home", systemImage: "text.book.closed")
            }
            NavigationLink(destination: CreateNewText()) {
                Label("Create", systemImage: "doc.fill.badge.plus")
            }
        }
        .listStyle(SidebarListStyle())
    }
}

struct FloatingButtonCreateView: View {
    @Binding var showingAlert: Bool

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Button(action: {
                    showingAlert = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 100 : 70,
                               height: UIDevice.current.userInterfaceIdiom == .pad ? 100 : 70)
                        .foregroundColor(.white)
                        .background(Circle().fill(Color.blue))
                        .shadow(radius: 10)
                }
                .padding(.bottom, geometry.safeAreaInsets.bottom + 20)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
