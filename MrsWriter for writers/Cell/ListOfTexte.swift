//
//  ListOfTexte.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 05/08/2024.
//

import SwiftUI
import SwiftData

struct ListOfTexte: View {
    let textes: [TextClass]
    @Query private var texteFromDatabase: [TextClass]
    var body: some View {
        NavigationStack {
            VStack {
                Text("yourlastchapte")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20, weight: .bold))
                    .padding()
                
                ScrollView {
                    VStack(spacing: 16) {
                        // Sort the texteFromDatabase array by lastModificationDate in descending order
                        ForEach(texteFromDatabase.sorted(by: { $0.lastModificationDate > $1.lastModificationDate }), id: \.id) { text in
                            NavigationLink(destination: EditTextView(text: text)) {
                                TextCardView(text: text)
                                    .padding(.horizontal, 12)
                            }
                            .buttonStyle(PlainButtonStyle())  // Removes the blue color and default button styling
                        }
                    }
                    .padding(.top, 16)
                }
            }
        }
    }
}

#Preview {
    ListOfTexte(textes: TextClass.previewTextsClass)
}
