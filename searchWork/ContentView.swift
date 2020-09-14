//
//  ContentView.swift
//  searchWork
//
//  Created by wagn on 2020/9/12.
//  Copyright © 2020 wagn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchTerm : String = ""
    
    var body: some View {
        NavigationView{
            SearchBar(text: $searchTerm)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,-350)
                .navigationBarTitle(Text("Search"))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    var body: some View {
        return NavigationLink(destination: SearchVC()){
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading, 10)
                    .foregroundColor(.secondary)
                TextField("Tap here to search", text: $text)
                    .padding(7)
            }
        }
    }
}


