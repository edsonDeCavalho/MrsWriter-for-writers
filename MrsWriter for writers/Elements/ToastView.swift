//
//  ToastView.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 16/08/2024.
//

import SwiftUI


struct Toast: View {
    let message: String
    @Binding var isShowing: Bool

    var body: some View {
        VStack {
            if isShowing {
                Text(message)
                    .padding()
                    .background(Color.black.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding()
                    .transition(.opacity)
                    .animation(.easeInOut, value: isShowing)
            }
        }
    }
}

