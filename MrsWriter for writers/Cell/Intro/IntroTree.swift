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
        NavigationStack { // Use NavigationStack for modern navigation handling
            GeometryReader { geometry in
                ZStack {
                    Color.green
                        .edgesIgnoringSafeArea(.all)

                    VStack {
                        Spacer()
                        
                        Image("Logoapp")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .frame(maxWidth: geometry.size.width * (UIDevice.current.userInterfaceIdiom == .pad ? 0.5 : 0.7)) // Adjust width based on device
                            .opacity(isLogoVisible ? 1 : 0) // Animation: fade in
                            .animation(.easeIn(duration: 1.0), value: isLogoVisible)

                        Text("Intro3_Instructions")
                            .font(.system(size: adaptiveFontSize(geometry: geometry))) // Adaptive font size
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                            .lineLimit(nil) // Ensure text does not truncate
                            .fixedSize(horizontal: false, vertical: true)
                        
                        FloatingButton() // Assuming this is a custom view
                        
                        NavigationLink(destination: ContentView()) {
                            Text("Let's go")
                                .font(.system(size: adaptiveButtonFontSize(geometry: geometry)))
                                .fontWeight(.bold)
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(28)
                                .frame(maxWidth: geometry.size.width * (UIDevice.current.userInterfaceIdiom == .pad ? 0.4 : 0.6)) // Adjust button width based on device
                        }
                        .padding(.top, 20) // Add padding above the button
                    }
                    .padding() // General padding for the VStack
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure the VStack expands to fill available space
                }
                .onAppear {
                    isLogoVisible = true // Trigger the fade-in animation when the view appears
                }
            }
        }
    }
    
    private func adaptiveFontSize(geometry: GeometryProxy) -> CGFloat {
        let baseSize: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 30 : 24 // Base font size
        let screenWidth = geometry.size.width

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
    
    private func adaptiveButtonFontSize(geometry: GeometryProxy) -> CGFloat {
        let baseSize: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 22 : 18 // Base font size for button
        let screenWidth = geometry.size.width

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
