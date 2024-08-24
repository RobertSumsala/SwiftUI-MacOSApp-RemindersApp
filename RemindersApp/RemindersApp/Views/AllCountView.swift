//
//  AllCountView.swift
//  RemindersApp
//
//  Created by Róbert Šumšala Jr. on 16/07/2024.
//

import SwiftUI

struct AllCountView: View {
    
    let count: Int
    
    var body: some View {
        HStack {
            VStack {
                Image(systemName: Constants.Icons.trayFullFill)
                    .font(.largeTitle)
                Text("All")
            }
            Spacer()
            VStack {
                Text("\(count)")
                    .font(.title)
                EmptyView()
            }
        }
        .padding()
        .background(Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
    }
}

#Preview {
    AllCountView(count: 10)
}
