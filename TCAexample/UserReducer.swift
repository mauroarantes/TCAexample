//
//  UserReducer.swift
//  TCAexample
//
//  Created by Mauro Arantes on 26/09/2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct UserList {
    @ObservableState
    struct State: Equatable {
        var results: [User] = []
        var isLoading = true
    }
    
    enum Action {
        case fetchUsers
        case usersResponse(Result<[User], Error>)
    }
    
    @Dependency(\.userClient) var userClient
    private enum CancelID { case users }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .fetchUsers:
                return .run { send in
                    await send(
                        .usersResponse(
                            Result{ try await self.userClient.fetchUsers() }
                        )
                    )
                }
            case .usersResponse(.success(let users)):
                state.isLoading = false
                state.results = users
                return .none
            case .usersResponse(.failure(_)):
                return .none
            }
        }
    }
}
