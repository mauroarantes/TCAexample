//
//  User.swift
//  TCAexample
//
//  Created by Mauro Arantes on 25/09/2024.
//

import Foundation

struct User: Identifiable, Decodable, Equatable, Sendable {
    let id: Int
    let name: String
    let email: String
}

extension [User] {
    static let mock = [
        User(id: 22, name: "Joe", email: "joe@gmail.com"),
        User(id: 44, name: "Mary", email: "mary@hotmail.com")
    ]
}
