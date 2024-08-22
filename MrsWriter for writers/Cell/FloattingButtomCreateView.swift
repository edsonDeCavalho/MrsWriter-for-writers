//
//  FloattingButtomCreateView.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 05/08/2024.
//

import SwiftUI

struct FloattingButtomCreateView: View {
    @Binding var showingAlert: Bool
    var body: some View {
        Button(action: {
            print("Floating button tapped")
            showingAlert = true
            // Add action for floating button
        }) {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .foregroundColor(.white)
                .background(Circle().fill(Color.green))
                .shadow(radius: 2)
        }
        .padding()
        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height - 150) // Adjust y-value based on your needs
    }
}
struct FloatingButtonCreateView_Previews: PreviewProvider {
    @State static var showingAlert = true
    
    static var previews: some View {
        ZStack {
            // Background view to simulate the main content
            Color.gray.opacity(0.2).edgesIgnoringSafeArea(.all)
            
            // Floating button preview
            FloattingButtomCreateView(showingAlert: $showingAlert)
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("chooseoPTION"),
                        primaryButton: .default(Text("addBook")) {
                            print("Add Book tapped")
                        },
                        secondaryButton: .default(Text("addChapter")) {
                            print("Add File tapped")
                        }
                    )
                }
        }
    }
}
