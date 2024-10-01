//
//  ContentView.swift
//  TCAexample
//
//  Created by Mauro Arantes on 25/09/2024.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    @Bindable var store: StoreOf<UserList>
    
    var body: some View {
        VStack {
            if store.isLoading {
                ProgressView()
            } else {
                List(store.results) { user in
                    Text(user.name)
                }
            }
        }
        .task {
            await store.send(.fetchUsers).finish()
        }
    }
}

#Preview {
    ContentView(store: Store(initialState: UserList.State(), reducer: {
        UserList()
    }))
}
