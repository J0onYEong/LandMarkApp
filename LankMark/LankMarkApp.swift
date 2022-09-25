//
//  LankMarkApp.swift
//  LankMark
//
//  Created by 최준영 on 2022/09/25.
//

import SwiftUI

@main
struct LankMarkApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
