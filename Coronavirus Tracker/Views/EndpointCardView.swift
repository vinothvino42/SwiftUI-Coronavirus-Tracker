//
//  ListItemView.swift
//  Coronavirus Tracker
//
//  Created by Vinoth Vino on 02/07/20.
//  Copyright © 2020 Vinoth Vino. All rights reserved.
//

import SwiftUI

struct EndpointCardView: View {
    var endpoint: Endpoint
    var value: Int
        
    static let cardsData = [
        Endpoint.cases: EndpointCardData(title: "Cases", image: "cases", color: Color("cases")),
        Endpoint.active: EndpointCardData(title: "Active", image: "active", color: Color("active")),
        Endpoint.deaths: EndpointCardData(title: "Deaths", image: "death", color: Color("death")),
        Endpoint.recovered: EndpointCardData(title: "Recovered", image: "recovered", color: Color("recovered")),
    ]
    
    var title: String {
        return EndpointCardView.cardsData[endpoint]?.title ?? ""
    }
    
    var image: String {
        return EndpointCardView.cardsData[endpoint]?.image ?? ""
    }
    
    var cases: String {
        return "\(value)"
    }
    
    var color: Color {
        return EndpointCardView.cardsData[endpoint]?.color ?? Color("cases")
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
            HStack {
                Image(image)
                    .colorMultiply(color)
                Spacer()
                Text(cases)
            }
            .font(.largeTitle)
        }
        .padding()
        .foregroundColor(color)
    }
}

