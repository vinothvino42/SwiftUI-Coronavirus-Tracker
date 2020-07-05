//
//  Resource.swift
//  Coronavirus Tracker
//
//  Created by Vinoth Vino on 04/07/20.
//  Copyright © 2020 Vinoth Vino. All rights reserved.
//

import Foundation

typealias HTTPMethod = String
typealias Parameters = [String: Any]

struct Resource<T: Decodable> {
    let url: String
    var httpMethod: HTTPMethod = "GET"
    var params: Parameters? = nil
}

extension Resource {
    init?(url: String) throws {
        if url == "" {
            throw CoronaApiError.emptyUrl
        }
        self.url = url
    }
}
