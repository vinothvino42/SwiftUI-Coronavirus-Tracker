//
//  BaseModel.swift
//  Coronavirus Tracker
//
//  Created by Vinoth Vino on 05/07/20.
//  Copyright © 2020 Vinoth Vino. All rights reserved.
//

import Foundation

class BaseModel: Codable {
    var date: String
    var data: Int
    
    init(date: String, data: Int) {
        self.date = date
        self.data = data
    }
}
