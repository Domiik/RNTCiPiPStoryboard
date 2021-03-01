//
//  Player.swift
//  RNTCiPiPStoryboard
//
//  Created by Domiik on 01.02.2021.
//  Copyright © 2021 Domiik. All rights reserved.
//

import Foundation

struct PlayerResponse: Codable {
    let data: [Player]
}


struct Player: Codable {
    let token: String
    let jwt: String
    
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
        case jwt = "jwt"
    }
}
