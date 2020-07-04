//
//  CoronaApiError.swift
//  Coronavirus Tracker
//
//  Created by Vinoth Vino on 03/07/20.
//  Copyright © 2020 Vinoth Vino. All rights reserved.
//

import Foundation

enum CoronaApiError: Error {
    case invalidUrl
    case emptyUrl
    case invalidSerialization
    case badHttpResponse
    case noData
    case error(NSError)
}

extension CoronaApiError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .emptyUrl:
            return NSLocalizedString("Please create resource object with URL", comment: "")
        default:
            break
        }
    }
}
