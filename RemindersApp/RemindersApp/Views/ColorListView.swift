//
//  ColorListView.swift
//  RemindersApp
//
//  Created by Róbert Šumšala Jr. on 12/07/2024.
//

import SwiftUI

struct ColorListView: View {
    
    let colors: [Color] = [Color.red, Color.orange, Color.green, Color.blue, Color.purple]
    
    @Binding var selectedColor: Color

    
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                Image(systemName: selectedColor == color ? Constants.Icons.recordFill : Constants.Icons.circleFill)
                    .foregroundColor(color)
                    .font(.system(size: 16))
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedColor = color
                    }
            }
        }

    }
}

#Preview {
    ColorListView(selectedColor: .constant(.blue))
}
