//
//  RemindersAppApp.swift
//  RemindersApp
//
//  Created by Róbert Šumšala Jr. on 12/07/2024.
//

import SwiftUI

@main
struct RemindersAppApp: App {
    var body: some Scene {
        WindowGroup {
            let viewContext = CoreDataManager.shared.persistentContainer.viewContext
            
            HomeScreen().environment(\.managedObjectContext, viewContext)
        }
    }
}
