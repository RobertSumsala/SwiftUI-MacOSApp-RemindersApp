//
//  ListItemCellView.swift
//  RemindersApp
//
//  Created by Róbert Šumšala Jr. on 14/07/2024.
//

import SwiftUI

struct ListItemCellView: View {
    
    @State private var active: Bool = false
    @State private var showEditPopover: Bool = false
    @State private var checked: Bool = false
    
    let item: MyListItemViewModel
    
    let delay = Delay()
    
    var onListItemDeleted: (MyListItemViewModel) -> Void = {_ in }
    var onListItemCompleted: (MyListItemViewModel) -> Void = {_ in }
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: checked ? Constants.Icons.checkmarkCircleFill : Constants.Icons.circle)
                .foregroundColor(checked ? .green : .primary)
                .font(.system(size: 14))
                .opacity(checked ? 0.85 : 0.2)
                .onTapGesture {
                    checked.toggle()
                    
                    if checked {
                        delay.performWork {
                            onListItemCompleted(item)
                        }
                    } else {
                        delay.cancel()
                    }
                }
            
            VStack(alignment: .leading) {
                Text(item.title)
                if let dueDate = item.dueDate {
                    Text(dueDate.title)
                        .opacity(0.4)
                        .foregroundColor(dueDate.isPastDue ? .red : .primary)
                }
                Spacer()
            }
            
            Spacer()
            
            if active {
                Image(systemName: Constants.Icons.trash)
                    .foregroundColor(.red)
                    .onTapGesture {
                        onListItemDeleted(item)
                    }
                Image(systemName: Constants.Icons.pencilWithLine)
                    .foregroundColor(.purple)
                    .onTapGesture {
                        showEditPopover = true
                    }.popover(isPresented: $showEditPopover, arrowEdge: .leading) {
                        EditListItemView(item: item) {
                            showEditPopover = false
                            active = false
                        }
                    }
            }
            
        }
        .contentShape(Rectangle())
        .onHover(perform: { hovering in
            if !showEditPopover {
                active = hovering
            }
        })
    }
}

#Preview {
    ListItemCellView(item: MyListItemViewModel(myListItem: MyListItem()))
}
