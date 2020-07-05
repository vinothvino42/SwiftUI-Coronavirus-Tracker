//
//  CoronaLocalDataRepository.swift
//  Coronavirus Tracker
//
//  Created by Vinoth Vino on 04/07/20.
//  Copyright © 2020 Vinoth Vino. All rights reserved.
//

import Foundation

protocol CoronaLocalDataRepositoryDataSource {
    func getData() -> EndpointsData
    func setData(endpointsData: EndpointsData)
}

struct CoronaLocalDataRepository: CoronaLocalDataRepositoryDataSource {
    let userDefaults = UserDefaults.standard
    
    static func endpointValueKey(endpoint: Endpoint) -> String {
        return "\(endpoint)/value"
    }
    
    static func endpointDateKey(endpoint: Endpoint) -> String {
        return "\(endpoint)/date"
    }
    
    func getData() -> EndpointsData {
        var values: [Endpoint: EndpointData] = [:]
        Endpoint.allCases.forEach { (endpoint) in
            let value = userDefaults.integer(forKey: Self.endpointValueKey(endpoint: endpoint))
            let dateStr = userDefaults.string(forKey: Self.endpointDateKey(endpoint: endpoint))
            if (dateStr != nil) {
                let date = Date()
                values[endpoint] = EndpointData(value: value, date: date)
            }
        }
        return EndpointsData(values: values)
    }
    
    func setData(endpointsData: EndpointsData) {
        endpointsData.values.forEach { (endpoint, endpointData) in
            userDefaults.set(endpointData.value, forKey: Self.endpointValueKey(endpoint: endpoint))
            userDefaults.set(endpointData.date.timeIntervalSince1970, forKey: Self.endpointDateKey(endpoint: endpoint))
        }
    }
}
