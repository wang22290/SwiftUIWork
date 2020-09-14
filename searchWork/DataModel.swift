//
//  SwiftUIView.swift
//  searchWork
//
//  Created by wagn on 2020/9/13.
//  Copyright © 2020 wagn. All rights reserved.
//

import SwiftUI

struct DataModel : Identifiable {
    var id = UUID()
    var name: String
    //    var list: Array
    var instockName: String
    var inStockPay: String
    var inStockMoney: String
    
    var outstockName: String
    var outStockPay: String
    var outStockMoney: String
    var showOut: Bool {return outstockName.count > 0}
    var typeString: String
    
    init(name:String,instockName:String,inStockPay:String,inStockMoney:String,outstockName:String,outStockPay:String,outStockMoney:String,typeString:String) {
        self.name = name
        self.instockName = instockName
        self.inStockPay = inStockPay
        self.inStockMoney = inStockMoney
        self.outStockMoney = outStockMoney
        self.outStockPay = outStockPay
        self.outstockName = outstockName
        self.typeString = typeString
    }
}

let dataModels = [
    DataModel(name:"Vauum",instockName:"V11",inStockPay:"In-stock",inStockMoney:"$599.99",outstockName:"V10",outStockPay:"Out-of-stock",outStockMoney:"$399.99",typeString: "Dyson"),
    
    DataModel(name:"Supersonic",instockName:"V11",inStockPay:"In-stock",inStockMoney:"$399.99",outstockName:"",outStockPay:"",outStockMoney:"",typeString: "Dyson")
]
