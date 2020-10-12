//
//  LoginResponse.swift
//  platzitweets
//
//  Created by Omar Flores on 10/10/20.
//

import Foundation

struct LoginResponse: Codable {
    let user: User
    let token: String
}
