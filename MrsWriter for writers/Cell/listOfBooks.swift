//
//  listOfBooks.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 05/08/2024.
//

import SwiftUI
import SwiftData

struct ListOfBooks: View {
    var books: [BookClass]
    @Query private var booksFromDataBse: [BookClass]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("yourbooks")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20, weight: .bold))
                    .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        if(booksFromDataBse.isEmpty){
                            BookCardEmptyView()
                        }else{
                            ForEach(booksFromDataBse, id: \.id) { book in
                                NavigationLink(destination: BookPageView(book: book)) {
                                    BookCardView(book: book)
                                        .foregroundColor(.primary) // Set the text color
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
    
private func fetchTexts(for bookId: UUID) -> [TextClass] {
       let bookIdString = bookId.uuidString
       print(bookIdString)
       return TextClass.previewTextsClass.filter { $0.book_id == bookIdString }
}
struct ListOfBooks_Previews: PreviewProvider {
    static var previews: some View {
        ListOfBooks(books: BookClass.previewBooksClass)
    }
}
