//
//  BookCardView.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 05/08/2024.
//

import SwiftUI

struct BookCardView: View {
    
    var book: BookClass
    @Environment(\.modelContext) private var context
    
    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: book.lastModificationDate)
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Text(book.title)
                    .font(.title3)
                    .padding()
                Spacer()
                Text(formattedDate)
                    .font(.caption)
                    .padding([.bottom], 10)
            }
            .frame(width: 160, height: 160)
            .background(Color(hex: book.color))
            .cornerRadius(10)
            .shadow(radius: 5)
            
            // Add a three-dot menu in the top-right corner
            Menu {
                Button(action: {
                    // Action for the first menu item
                    print("Edit clicked")
                }) {
                    Label("Edit", systemImage: "pencil")
                }
                
                Button(action: {
                    // Action for the second menu item
                    context.delete(book)
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
                    .font(.system(size: 40,weight: .bold))
                    .padding([.top, .trailing], 5)
                    .foregroundColor(Color.white)
                    
            }
        }
    }
}

struct BookCardView_Previews: PreviewProvider {
    static var previews: some View {
        BookCardView(book: BookClass.previewBookClass)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
