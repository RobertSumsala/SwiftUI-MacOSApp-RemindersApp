//
//  MyListItemsHeaderView.swift
//  RemindersApp
//
//  Created by Róbert Šumšala Jr. on 13/07/2024.
//

import SwiftUI

struct MyListItemsHeaderView: View {
    
    let name: String
    let color: Color
    let count: Int
    
    
    
    var body: some View {
        HStack {
            Text(name)
                .font(.system(size: 28))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(color)
                .padding()
            
            Spacer()
            
            Text("\(count)") 
                .font(.system(size: 32))
                .foregroundColor(color)
                .padding()
        }
    }
}

#Preview {
    MyListItemsHeaderView(name: "Groceries", color: Color.blue, count: 6)
}
