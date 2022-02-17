//
//  SwiftUI_ConceptsApp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 07/02/22.
//

import SwiftUI

@main
struct SwiftUI_ConceptsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            IntroView()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
