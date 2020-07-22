//
//  CoronaApiService.swift
//  Coronavirus Tracker
//
//  Created by Vinoth Vino on 03/07/20.
//  Copyright © 2020 Vinoth Vino. All rights reserved.
//

import Foundation
import Combine

protocol ApiServiceDelegate {
    func executeHTTPRequest<T>(withResource resource: Resource<T>) -> AnyPublisher<T, CoronaApiError>
}

protocol CoronaApiServiceDataSource {
    func getAccessToken() -> AnyPublisher<String, CoronaApiError>
    func getEndpointData(acessToken: String, endPoint: Endpoint) -> AnyPublisher<EndpointData, CoronaApiError>
}

protocol CoronaDataSource: ApiServiceDelegate, CoronaApiServiceDataSource {}

final class CoronaApiService: CoronaDataSource {
    static let shared = CoronaApiService()
    
    private let baseUrl = "https://apigw.nubentos.com/t/nubentos.com/ncovapi/2.0.0"
    private let urlSession = URLSession.shared
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        return decoder
    }()
    
    private init() {}
    
    func executeHTTPRequest<T>(withResource resource: Resource<T>) -> AnyPublisher<T, Error> {
        guard let url = URL(string: resource.url) else {
            fatalError(CoronaApiError.invalidUrl.errorDescription ?? "")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func getAccessToken() -> AnyPublisher<String, Error> {
        var resource = try! Resource<AccessTokenModel>(url: "https://apigw.nubentos.com:443/token?grant_ype=client_credentials")!
        resource.httpMethod = "POST"
        
        return executeHTTPRequest(withResource: resource)
            .receive(on: RunLoop.main)
            .map(\.accessToken)
            .eraseToAnyPublisher()
    }
    
    func getEndpointData(acessToken: String, endPoint: Endpoint) -> AnyPublisher<EndpointData, Error> {
        let resource = try! Resource<[BaseModel]>(url: baseUrl + endPoint.rawValue)!
        
        return executeHTTPRequest(withResource: resource)
            .map( { $0 })
            
        
        executeHTTPRequest(withResource: resource) { (result) in
            switch result {
            case .success(let datas):
                let data = datas[0]
                let date = Date.convertStringToDate(date: data.date)
                let endpointData = EndpointData(value: data.data, date: date)
                completionHandler(.success(endpointData))
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(.failure(.noData))
            }
        }
    }
}
