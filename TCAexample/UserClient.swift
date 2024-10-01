//
//  UserClient.swift
//  TCAexample
//
//  Created by Mauro Arantes on 25/09/2024.
//

import Foundation
import ComposableArchitecture

@DependencyClient
struct UserClient {
    var fetchUsers: @Sendable () async throws -> [User]
}

extension UserClient: TestDependencyKey {
    static let previewValue = Self(fetchUsers: {.mock})
    
    static let testValue = Self()
}

extension DependencyValues {
    var userClient: UserClient {
        get { self[UserClient.self]}
        set { self[UserClient.self] = newValue}
    }
}

extension UserClient: DependencyKey {
    static let liveValue = UserClient {
        let (data, _) = try await URLSession.shared.data(from: URL(string: "https://jsonplaceholder.typicode.com/users")!)
        return try JSONDecoder().decode([User].self, from: data)
    }
}
