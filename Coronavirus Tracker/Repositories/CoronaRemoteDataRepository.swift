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
    func getEndpointsData(endpoint: Endpoint, completionHandler: @escaping (Result<EndpointData, CoronaApiError>) -> Void)
    func getDataRefreshToken(onGetData: () -> Void) -> Void
    func getAllEndpointsData(completionHandler: @escaping (Result<EndpointsData, CoronaApiError>) -> Void)
    func getAllEndpointsValues(completionHandler: @escaping (Result<EndpointsData, CoronaApiError>) -> Void)
}

class CoronaRemoteDataRepository: CoronaRemoteDataRepositoryDataSource {
    let coronaLocalDataRepository = CoronaLocalDataRepository()
    let coronaApiService = CoronaApiService.shared
    
    private var accessToken: String?
    
    var getAllEndpointsCachedData: EndpointsData {
        return coronaLocalDataRepository.getData()
    }
    
    func getEndpointsData(endpoint: Endpoint, completionHandler: @escaping (Result<EndpointData, CoronaApiError>) -> Void) {
        self.getDataRefreshToken {
            coronaApiService.getEndpointData(acessToken: accessToken!, endPoint: endpoint) { (result) in
                switch result {
                case .success(let endpointData):
                    completionHandler(.success(endpointData))
                case .failure(let error):
                    print(error.localizedDescription)
                    completionHandler(.failure(.error(error as NSError)))
                }
            }
        }
    }
    
    func getAllEndpointsData(completionHandler: @escaping (Result<EndpointsData, CoronaApiError>) -> Void) {
        self.getDataRefreshToken {
            getAllEndpointsValues { (result) in
                switch result {
                case .success(let endpointsData):
                    self.coronaLocalDataRepository.setData(endpointsData: endpointsData)
                    completionHandler(.success(endpointsData))
                case .failure(let error):
                    print(error.localizedDescription)
                    return
                }
            }
        }
    }
    
    func getDataRefreshToken(onGetData: () -> Void) -> Void {
        if self.accessToken == nil {
            self.coronaApiService.getAccessToken { (result) in
                switch result {
                case .success(let token):
                    self.accessToken = token
                case .failure(let error):
                    print(error.localizedDescription)
                    break
                }
            }
        }
    }
    
    func getAllEndpointsValues(completionHandler: @escaping (Result<EndpointsData, CoronaApiError>) -> Void) {
        completionHandler(.success(EndpointsData(values: [Endpoint.cases: EndpointData(value: 0, date: Date())])))
    }
}
