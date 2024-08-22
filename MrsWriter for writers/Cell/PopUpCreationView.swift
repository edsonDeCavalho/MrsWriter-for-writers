//
//  PopUpCreationView.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 05/08/2024.
//

import SwiftUI

struct PopUpCreationView: View {
    @Binding var isPresented: Bool
    @Binding var navigateToCreateBook: Bool
    @Binding var navigateToCreateFile: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    navigateToCreateBook = true
                    isPresented = false
                }) {
                    VStack {
                        Image(systemName: "book.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        Text("createbook")
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }

                Button(action: {
                    navigateToCreateFile = true
                    isPresented = false
                }) {
                    VStack {
                        Image(systemName: "doc.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        Text("createfile")
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .padding()
        }
        .frame(width: 300, height: 200)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .overlay(
            Button(action: {
                isPresented = false
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .padding(10)
            },
            alignment: .topTrailing
        )
        .padding()
    }
}
