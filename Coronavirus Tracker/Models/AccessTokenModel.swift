//
//  AccessTokenModel.swift
//  Coronavirus Tracker
//
//  Created by Vinoth Vino on 05/07/20.
//  Copyright © 2020 Vinoth Vino. All rights reserved.
//

import Foundation

class AccessTokenModel: Codable {
    var accessToken: String
    var expiresIn: Int
    
    init(token: String, expires: Int) {
        self.accessToken = token
        self.expiresIn = expires
    }
}
