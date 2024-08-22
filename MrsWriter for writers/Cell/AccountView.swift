//
//  AccountView.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 27/07/2024.
//

import SwiftUI

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("This is the detail view")
            }.navigationTitle("Your account")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Icon tapped in DetailView")
                    }) {
                        Image(systemName: "gearshape.fill")
                    }
                } 
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Icon tapped in DetailView")
                    }) {
                        Image(systemName: "info.circle")
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AccountView()
}
