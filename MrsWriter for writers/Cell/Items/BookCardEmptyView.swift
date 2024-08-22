//
//  BookCardEmptyView.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 21/08/2024.
//

import SwiftUI

struct BookCardEmptyView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: CreateANewBookView()) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 130)
                    .foregroundColor(Color(.white))
                    .background(Circle().fill(Color.blue))
                    .shadow(radius: 5)
            }
            .frame(width: 160, height: 160)
            .background(Color(.white))
            .cornerRadius(10)
            .shadow(radius: 5)
        }
    }
}

#Preview {
    BookCardEmptyView()
}

     
