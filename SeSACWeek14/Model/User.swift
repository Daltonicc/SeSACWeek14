//
//  User.swift
//  SeSACWeek14
//
//  Created by 박근보 on 2021/12/27.
//

import Foundation

struct User: Codable {
    let jwt: String
    let user: UserData
}

// MARK: - User
struct UserData: Codable {
    let id: Int
    let username, email: String
}
