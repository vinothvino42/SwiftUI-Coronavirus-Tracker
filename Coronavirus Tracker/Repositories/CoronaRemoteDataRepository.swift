//
//  CoronaRepository.swift
//  Coronavirus Tracker
//
//  Created by Vinoth Vino on 04/07/20.
//  Copyright © 2020 Vinoth Vino. All rights reserved.
//

import Foundation

protocol CoronaRemoteDataRepositoryDataSource{
    var getAllEndpointsCachedData: EndpointsData { get set }
    func getEndpointsData(endpoint: Endpoint) -> EndpointData
    func getDataRefreshToken() -> (() -> Void)
    func getAllEndpointsData() -> EndpointsData
}

struct CoronaRemoteDataRepository: CoronaRemoteDataRepositoryDataSource {
    var getAllEndpointsCachedData: EndpointsData {
        get {
            
        }
        set {
            
        }
    }
    
    func getEndpointsData(endpoint: Endpoint) -> EndpointData {
        <#code#>
    }
    
    func getDataRefreshToken() -> (() -> Void) {
        <#code#>
    }
    
    func getAllEndpointsData() -> EndpointsData {
        <#code#>
    }
}
