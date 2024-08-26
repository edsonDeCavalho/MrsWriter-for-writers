//
//  WelcomeView.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 27/07/2024.
//

import SwiftUI

import SwiftUI

struct WelcomeView: View {
    @State private var isLogoVisible = false

    var body: some View {
        NavigationStack { // Use NavigationStack instead of NavigationView
            GeometryReader { geometry in
                ZStack {
                    Color.green
                        .edgesIgnoringSafeArea(.all)

                    VStack {
                        Image("Logoapp")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .frame(maxWidth: geometry.size.width * (UIDevice.current.userInterfaceIdiom == .pad ? 0.5 : 0.7)) // Adjust width based on device
                            .opacity(isLogoVisible ? 1 : 0) // Animation: fade in
                            .animation(.easeIn(duration: 1.0), value: isLogoVisible)

                        Text("welcometomrswriter")
                            .font(.system(size: geometry.size.width * (UIDevice.current.userInterfaceIdiom == .pad ? 0.05 : 0.07), weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                            .padding(.horizontal, geometry.size.width * 0.1) // Adjust padding relative to screen size

                        NavigationLink(destination: IntroOne()) {
                            Text("continuebutton")
                                .font(.system(size: geometry.size.width * (UIDevice.current.userInterfaceIdiom == .pad ? 0.04 : 0.05), weight: .bold))
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(28)
                                .frame(maxWidth: geometry.size.width * (UIDevice.current.userInterfaceIdiom == .pad ? 0.4 : 0.6)) // Adjust button width
                        }
                        .padding(.top, 20)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure the VStack fills the screen
                }
                .onAppear {
                    isLogoVisible = true // Trigger the fade-in animation when the view appears
                }
            }
            .navigationBarHidden(true) // Hide the navigation bar if desired
        }
    }
}


#Preview {
    WelcomeView()
}
