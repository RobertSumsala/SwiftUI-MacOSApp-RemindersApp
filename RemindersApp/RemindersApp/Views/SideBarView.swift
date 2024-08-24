//
//  SideBarView.swift
//  RemindersApp
//
//  Created by Róbert Šumšala Jr. on 12/07/2024.
//

import SwiftUI

struct SideBarView: View {
    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            
            MyListsView(vm: MyListsViewModel(context: context))
            
            Spacer()
            Button {
                isPresented = true
            } label: {
                HStack {
                    Image(systemName: Constants.Icons.plusInCircle)
                    Text("Add List")
                }
            }.buttonStyle(.plain)
                .padding()
            
        }.sheet(isPresented: $isPresented) {
            
        } content: {
            AddNewListView(vm: AddNewListViewModel(context: context))
        }
    }
}

#Preview {
    SideBarView()
}
