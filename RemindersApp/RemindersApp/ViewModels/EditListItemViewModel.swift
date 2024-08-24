//
//  EditListItemViewModel.swift
//  RemindersApp
//
//  Created by Róbert Šumšala Jr. on 15/07/2024.
//

import Foundation

class EditListItemViewModel: ObservableObject {
    
    var listItemVM: MyListItemViewModel
    @Published var title: String = ""
    @Published var selectedDate: Date?
    
    init(listItemVM: MyListItemViewModel) {
        self.listItemVM = listItemVM
        title = listItemVM.title
        selectedDate = listItemVM.dueDate != nil ? (listItemVM.dueDate!.value) : nil
    }
    
    func save() {
        let myListItem: MyListItem? = MyListItem.byId(id: listItemVM.listItemId)
        if let myListItem = myListItem {
            myListItem.title = title
            myListItem.dueDate = selectedDate
            try? myListItem.save()
        }
    }
    
}
