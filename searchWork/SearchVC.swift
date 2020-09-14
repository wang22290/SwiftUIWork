//
//  SearchVC.swift
//  searchWork
//
//  Created by wagn on 2020/9/13.
//  Copyright © 2020 wagn. All rights reserved.
//

import SwiftUI

struct SearchVC: View {
    @State private var searchTerm : String = ""
    var body: some View {
        VStack{
            SearchVCBar(text: $searchTerm)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,0)
            List(dataModels.filter({searchTerm.isEmpty ? true :$0.typeString.contains(searchTerm)})) { item in
                dataView(itemMode: item)
            }
        }
    }
}


struct SearchVC_Previews: PreviewProvider {
    static var previews: some View {
        SearchVC()
    }
}


struct SearchVCBar: View {
    @Binding var text: String
    @State private var isEditing = false
    var body: some View {
        
        HStack (){
            Image(systemName: "magnifyingglass")
                .padding(.leading, 10)
                .foregroundColor(.secondary)
            TextField("Tap here to search", text: $text)
                .padding(7)
                .onTapGesture {
                    self.isEditing = true
            }
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct dataView: View {
    let itemMode: DataModel
    var body: some View{
        VStack(){
            
            Text(itemMode.name)
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight:30,alignment: .leading)
                .background(Color(.systemGray6))
            
            VStack {
                Text(itemMode.instockName)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    
                    .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight:30,alignment: .leading)
                    .padding(.top,10)
                
                HStack {
                    Text(itemMode.inStockPay)
                        .foregroundColor(Color(.systemGray))
                        .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight:100,alignment: .leading)
                    
                    Spacer()
                    Text(itemMode.inStockMoney)
                        .foregroundColor(.blue)
                        .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight:50,alignment: .trailing)
                    
                }
                .padding()
                
                if itemMode.showOut{
                    Text(itemMode.outstockName)
                        .fontWeight(.bold)
                        .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight:30,alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .padding(.top,10)
                    HStack {
                        Text(itemMode.outStockPay)
                            .foregroundColor(Color(.systemGray))
                            .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight:30,alignment: .leading)
                        Spacer()
                        Text(itemMode.outStockMoney)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(.systemGray))
                        
                    }
                    .padding()
                }
                
            }
            
        }
    }
    
}
