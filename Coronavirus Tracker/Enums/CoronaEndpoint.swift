//
//  CoronaEndpoint.swift
//  Coronavirus Tracker
//
//  Created by Vinoth Vino on 03/07/20.
//  Copyright © 2020 Vinoth Vino. All rights reserved.
//

import Foundation

enum CoronaEndpoint: String {
    case casesSuspected = "cases/suspected"
    case casesConfirmed = "cases/confirmed"
    case deaths
    case recovered
    case cases
}
