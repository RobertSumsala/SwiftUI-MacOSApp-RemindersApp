//
//  MyListsView.swift
//  RemindersApp
//
//  Created by Róbert Šumšala Jr. on 13/07/2024.
//

import SwiftUI

struct MyListsView: View {
    
    @StateObject var vm: MyListsViewModel
    
    init(vm: MyListsViewModel) {
        _vm = StateObject(wrappedValue: vm)
    }

    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            List {
                AllCountView(count: vm.allListItemsCount)
                Text("My Lists")
                ForEach(vm.myLists) { myList in
                    
                    NavigationLink {
                        MyListItemsHeaderView(name: myList.name, color: myList.color, count: myList.itemsCount)
                        
                        MyListItemsView(items: myList.items, onItemAdded: { title, dueDate in
                            vm.saveTo(list: myList, title: title, dueDate: dueDate)
                        }, onItemDeleted: vm.deleteItem, onItemCompleted: vm.markAsCompleted)
                    } label: {
                        HStack{
                            Image(systemName: Constants.Icons.line3HorizontalCircleFill)
                                .font(.title)
                                .foregroundColor(myList.color)
                            Text(myList.name)
                            Spacer()
                            Text("\(myList.itemsCount)")
                        }
                    }.contextMenu {
                        Button {
                            vm.delete(myList)
                        } label: {
                            Label("Delete", systemImage: Constants.Icons.trash)
                        }
                    }
                }
            }
        }
    }
}

struct MyListsView_Previews: PreviewProvider {
    static var previews: some View {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        return MyListsView(vm: MyListsViewModel(context: context))
    }
}
