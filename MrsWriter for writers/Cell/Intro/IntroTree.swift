//
//  IntroTree.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 19/08/2024.
//

import SwiftUI

struct IntroTree: View {
    @State private var isLogoVisible = false

    var body: some View {
      
            ZStack {
                Color.green
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Image("Logoapp")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .frame(maxWidth: 300)
                        .opacity(isLogoVisible ? 1 : 0) // Animation: fade in
                        .animation(.easeIn(duration: 1.0), value: isLogoVisible) // Set animation

                    Text("Intro3_Instructions")
                        .font(.system(size: adaptiveFontSize())) // Adaptive font size
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center) // Center-align text
                        .padding()
                        .lineLimit(nil) // Ensure text does not truncate
                        .fixedSize(horizontal: false, vertical: true)
                    
                    FloatingButton()
                    
                    NavigationLink(destination: ContentView()) {
                        Text("Let's go")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(28) // Adjust corner radius for smaller buttons
                    }
                    .padding(.top, 20) // Add padding above the button
                }
                .padding() // General padding for the VStack
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure the VStack expands to fill available space
          
            .onAppear {
                isLogoVisible = true // Trigger the fade-in animation when the view appears
            }
        }
    }
    
    private func adaptiveFontSize() -> CGFloat {
        let baseSize: CGFloat = 24 // Base font size
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height

        // Adjust size based on screen width
        if screenWidth < 350 {
            return baseSize * 0.8
        } else if screenWidth < 400 {
            return baseSize * 0.9
        } else if screenWidth < 500 {
            return baseSize
        } else {
            return baseSize * 1.1
        }
    }
}


#Preview {
    IntroTree()
}
