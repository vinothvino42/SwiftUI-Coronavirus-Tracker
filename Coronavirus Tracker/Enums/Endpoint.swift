//
//  Endpoint.swift
//  Coronavirus Tracker
//
//  Created by Vinoth Vino on 03/07/20.
//  Copyright © 2020 Vinoth Vino. All rights reserved.
//

import Foundation

enum Endpoint: String, CaseIterable {
    case cases
    case active
    case deaths
    case recovered
}
