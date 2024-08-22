//
//  TextCardView.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 05/08/2024.
//

import SwiftUI

struct TextCardView: View {
    let text: TextClass
        private var formattedDate: String {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter.string(from: text.lastModificationDate)
        }
        
    var body: some View {
        HStack {
            Text(text.title)
                .font(.headline)
                .padding(.leading, 16)
            
            Spacer()
            
            // Add a three-dot menu in the top-right corner with custom color
            Menu {
                Button(action: {
                    // Action for the first menu item
                    print("Edit clicked")
                }) {
                    Label("Edit", systemImage: "pencil")
                }
                
                Button(action: {
                    // Action for the second menu item
                    print("Delete clicked")
                }) {
                    Label("Delete", systemImage: "trash")
                }
                
                Button(action: {
                    // Action for the third menu item
                    print("Share clicked")
                }) {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
            } label: {
                Text("⋮")
                    .font(.system(size: 20))
                    .foregroundColor(.white) // Change the color here
                    .padding(.trailing, 16)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
        .background(Color(hex: text.color))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal, 5)
    }
}

#Preview {
    TextCardView(text: TextClass.previewTextClass)
}
