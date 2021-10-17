//
//  Mobile2YouApp.swift
//  Mobile2You
//
//  Created by Rychillie Umpierre de Oliveira on 16/10/21.
//

import SwiftUI

@main
struct Mobile2YouApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MovieView(viewModel: MovieViewModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
