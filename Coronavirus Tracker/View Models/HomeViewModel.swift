//
//  HomeViewModel.swift
//  Coronavirus Tracker
//
//  Created by Vinoth Vino on 06/07/20.
//  Copyright © 2020 Vinoth Vino. All rights reserved.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var endpointsData: EndpointsData? = nil
    
    fileprivate let coronaRemoteDataRepository = CoronaRemoteDataRepository()
    
    init() {
//        updateData()
    }
}

extension HomeViewModel {
    func updateData() {
        coronaRemoteDataRepository.getAllEndpointsData { (result) in
            switch result {
            case .success(let endpoints):
                self.endpointsData = endpoints
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
