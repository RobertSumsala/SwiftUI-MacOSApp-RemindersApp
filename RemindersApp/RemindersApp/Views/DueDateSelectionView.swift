//
//  DueDateSelectionView.swift
//  RemindersApp
//
//  Created by Róbert Šumšala Jr. on 14/07/2024.
//

import SwiftUI

struct DueDateSelectionView: View {
    
    @Binding var dueDate: DueDate?
    @State private var selectedDate: Date = Date.today
    @State private var showCalendar: Bool = false
    
    var body: some View {
        
        Menu {
            Button {
                dueDate = .today
            } label: {
                VStack {
                    Text("Today \n \(Date.today.formatAsString)")
                }
            }
            
            Button {
                dueDate = .tomorrow
            } label: {
                VStack {
                    Text("Tomorrow \n \(Date.tomorrow.formatAsString)")
                }
            }
            
            Button {
                showCalendar = true
            } label: {
                Text("Custom")
            }
        } label: {
            Label(dueDate == nil ? "Add Date: " : dueDate!.title, systemImage: "calendar")
        }.menuStyle(.borderedButton)
            .fixedSize()
            .popover(isPresented: $showCalendar, content: {
                DatePicker("Custom", selection: $selectedDate, displayedComponents: .date)
                    .labelsHidden()
                    .datePickerStyle(.graphical)
                    .onChange(of: selectedDate) { oldValue, newValue in
                        dueDate = .custom(newValue)
                        showCalendar = false
                    }
            })
    }
}

#Preview {
    DueDateSelectionView(dueDate: .constant(nil))
}
