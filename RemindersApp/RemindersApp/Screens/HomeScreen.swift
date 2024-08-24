//
//  HomeScreen.swift
//  RemindersApp
//
//  Created by Róbert Šumšala Jr. on 12/07/2024.
//

import SwiftUI

struct HomeScreen: View {
    
    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
    
    var body: some View {
        NavigationView {
            
            let myListVM = MyListsViewModel(context: context)
            let firstListVM = myListVM.myLists.first
            
            SideBarView()
                .frame(minWidth: 200)
            
            if let firstListVM = firstListVM {
                MyListItemsHeaderView(name: firstListVM.name, color: firstListVM.color, count: firstListVM.itemsCount)
                MyListItemsView(items: firstListVM.items)
            }
            
        }
    }
}

#Preview {
    HomeScreen()
}
