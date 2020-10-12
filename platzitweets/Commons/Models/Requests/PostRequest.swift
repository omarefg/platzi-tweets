//
//  PostRequest.swift
//  platzitweets
//
//  Created by Omar Flores on 10/10/20.
//

import Foundation

struct PostRequest: Codable {
    let text: String
    let imageUrl: String?
    let videoUrl: String?
    let location: PostRequestLocation?
}
