//
//  RegisterRequest.swift
//  platzitweets
//
//  Created by Omar Flores on 10/10/20.
//

import Foundation

struct RegisterRequest: Codable {
    let email: String
    let password: String
    let names: String
}
