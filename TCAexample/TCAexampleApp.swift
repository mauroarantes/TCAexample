//
//  TCAexampleApp.swift
//  TCAexample
//
//  Created by Mauro Arantes on 25/09/2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCAexampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: UserList.State(), reducer: {
                UserList()
                    ._printChanges()
            }))
        }
    }
}
