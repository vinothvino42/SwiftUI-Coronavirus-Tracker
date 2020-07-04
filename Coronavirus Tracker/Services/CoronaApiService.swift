//
//  CoronaApiService.swift
//  Coronavirus Tracker
//
//  Created by Vinoth Vino on 03/07/20.
//  Copyright © 2020 Vinoth Vino. All rights reserved.
//

import Foundation

protocol ApiServiceDelegate {
    func executeHTTPRequest<T>(withResource resource: Resource<T>, completionHandler: @escaping (Result<T, CoronaApiError>) -> Void)
}

protocol CoronaApiServiceDataSource {
    func getAccessToken() -> String
    func getEndpointData() -> EndpointData
}

protocol CoronaDataSource: ApiServiceDelegate, CoronaApiServiceDataSource {}

final class CoronaApiService: CoronaDataSource {
    static let shared = CoronaApiService()
    
    private let baseUrl = "https://apigw.nubentos.com/t/nubentos.com/ncovapi/1.0.0"
    private let urlSession = URLSession.shared
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        return decoder
    }()
    
    private init() {}
    
    func executeHTTPRequest<T>(withResource resource: Resource<T>, completionHandler: @escaping (Result<T, CoronaApiError>) -> Void) {
        urlSession.dataTask(with: resource.url) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(.error(error as NSError)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                completionHandler(.failure(.badHttpResponse))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.noData))
            }
            
            do {
                let baseModel = try self.jsonDecoder.decode(T.self, from: data)
                completionHandler(.success(baseModel))
            } catch let error as NSError {
                print(error.localizedDescription)
                completionHandler(.failure(.invalidSerialization))
            }
        }.resume()
    }
    
    func getAccessToken() -> String {
        
    }
    
    func getEndpointData() -> EndpointData {
        
    }
}
