//
//  AddNewListView.swift
//  RemindersApp
//
//  Created by Róbert Šumšala Jr. on 12/07/2024.
//

import SwiftUI

struct AddNewListView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var vm: AddNewListViewModel
    
    init(vm: AddNewListViewModel){
        self.vm = vm
    }
    
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                Text("New List")
                    .font(.headline)
                    .padding(.bottom, 20)
                
                HStack {
                    Text("Name: ")
                    TextField("", text: $vm.name)
                }
                
                HStack {
                    Text("Color: ")
                    ColorListView(selectedColor: $vm.color)
                }
            }
            
            HStack {
                Spacer()
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                Button("Ok") {
                    vm.save()
                    presentationMode.wrappedValue.dismiss()
                }.disabled(vm.name.isEmpty)
            }
        }.frame(minWidth: 300)
            .padding()
        
    }
}

struct AddNewListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistentContainer.viewContext
        return AddNewListView(vm: AddNewListViewModel(context: viewContext))
    }
}


