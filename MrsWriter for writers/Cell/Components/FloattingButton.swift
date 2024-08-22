//
//  FloattingButton.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 19/08/2024.
//

import SwiftUI

struct FloatingButton: View {
       var body: some View {
        GeometryReader { geometry in
            VStack {
              
                Button(action: {
                    
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
    FloatingButton()
}
