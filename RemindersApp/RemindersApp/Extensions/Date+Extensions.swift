//
//  Date+Extensions.swift
//  RemindersApp
//
//  Created by Róbert Šumšala Jr. on 13/07/2024.
//

import Foundation

extension Date {
    static var today: Date {
        Date()
    }
    
    static var yesterday: Date {
        Calendar.current.date(byAdding: .day, value: -1, to: today)!
    }
    
    static var tomorrow: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: today)!
    }
    
    var formatAsString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: self)
    }
}
