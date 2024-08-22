//
//  WelcomeView.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 27/07/2024.
//

import SwiftUI

struct WelcomeView: View {
    @State private var isLogoVisible = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.green
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("Logoapp")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .frame(maxWidth: 300)
                        .opacity(isLogoVisible ? 1 : 0) // Animation: fade in
                        .animation(.easeIn(duration: 1.0), value: isLogoVisible) // Set animation

                    Text("welcometomrswriter")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center) // Center-align text
                        .padding()
                        .padding(.horizontal, 20) // Add horizontal padding for smaller screens

                    NavigationLink(destination: IntroOne()) {
                        Text("continuebutton")
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
            }
            .onAppear {
                isLogoVisible = true // Trigger the fade-in animation when the view appears
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    WelcomeView()
}
