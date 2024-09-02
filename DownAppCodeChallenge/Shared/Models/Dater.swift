//
//  Dater.swift
//  DownAppCodeChallenge
//
//  Created by Malachi Hul on 2024/08/19.
//

import Foundation

struct Dater: Codable {
    let name: String
    let userId: Int
    let age: Int
    let profilePic: String
    
    enum CodingKeys: String, CodingKey {
        case name, age
        case profilePic = "profile_pic_url"
        case userId = "user_id"
    }
}

