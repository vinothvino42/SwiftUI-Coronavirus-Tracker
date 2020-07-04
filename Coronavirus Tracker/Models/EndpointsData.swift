//
//  EndpointsData.swift
//  Coronavirus Tracker
//
//  Created by Vinoth Vino on 04/07/20.
//  Copyright © 2020 Vinoth Vino. All rights reserved.
//

import Foundation

struct EndpointsData {
    let values: [Endpoint: EndpointData]
    
    var cases: EndpointData {
        return values[Endpoint.cases]!
    }
    
    var casesSuspected: EndpointData {
        return values[Endpoint.casesSuspected]!
    }
    
    var casesConfirmed: EndpointData {
        return values[Endpoint.casesConfirmed]!
    }
    
    var deaths: EndpointData {
        return values[Endpoint.deaths]!
    }
    
    var recovered: EndpointData {
        return values[Endpoint.recovered]!
    }
}
