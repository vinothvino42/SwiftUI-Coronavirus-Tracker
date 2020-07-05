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
    func getAccessToken(completionHandler: @escaping (Result<String, CoronaApiError>) -> Void)
    func getEndpointData(acessToken: String, endPoint: Endpoint, completionHandler: @escaping (Result<EndpointData, CoronaApiError>) -> Void)
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
    
    func executeHTTPRequest<T>(withResource resource: Resource<T>, completionHandler: @escaping (Result<T, CoronaApiError>) -> Void) {
        guard let url = URL(string: resource.url) else {
            completionHandler(.failure(.invalidUrl))
            return
        }
        
        urlSession.dataTask(with: url) { (data, response, error) in
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
    
    func getAccessToken(completionHandler: @escaping (Result<String, CoronaApiError>) -> Void) {
        var resource = try! Resource<AccessTokenModel>(url: "https://apigw.nubentos.com:443/token?grant_ype=client_credentials")!
        resource.httpMethod = "POST"
        executeHTTPRequest(withResource: resource) { (result) in
            switch result {
            case .success(let accessModel):
                completionHandler(.success(accessModel.accessToken))
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(.failure(.accessTokenExpires))
            }
        }
    }
    
    func getEndpointData(acessToken: String, endPoint: Endpoint, completionHandler: @escaping (Result<EndpointData, CoronaApiError>) -> Void) {
        let resource = try! Resource<[BaseModel]>(url: baseUrl + endPoint.rawValue)!
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
