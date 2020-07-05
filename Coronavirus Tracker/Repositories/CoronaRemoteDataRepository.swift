//
//  CoronaRepository.swift
//  Coronavirus Tracker
//
//  Created by Vinoth Vino on 04/07/20.
//  Copyright © 2020 Vinoth Vino. All rights reserved.
//

import Foundation

protocol CoronaRemoteDataRepositoryDataSource{
    var getAllEndpointsCachedData: EndpointsData { get }
    func getEndpointsData(endpoint: Endpoint) -> EndpointData
    func getDataRefreshToken() -> (() -> Void)
    func getAllEndpointsData() -> EndpointsData
    func getAllEndpointsValues() -> EndpointsData
}

struct CoronaRemoteDataRepository: CoronaRemoteDataRepositoryDataSource {
    let coronaLocalDataRepository = CoronaLocalDataRepository()
    
    var getAllEndpointsCachedData: EndpointsData {
        return coronaLocalDataRepository.getData()
    }
    
    func getEndpointsData(endpoint: Endpoint) -> EndpointData {
        <#code#>
    }
    
    func getAllEndpointsData() -> EndpointsData {
        <#code#>
    }
    
    func getDataRefreshToken() -> (() -> Void) {
        <#code#>
    }
    
    func getAllEndpointsValues() -> EndpointsData {
        <#code#>
    }
}
