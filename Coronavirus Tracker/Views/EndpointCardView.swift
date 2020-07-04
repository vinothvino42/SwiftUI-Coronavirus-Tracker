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
        Endpoint.cases: EndpointCardData(title: "Cases", image: "count", color: Color("cases")),
        Endpoint.casesSuspected: EndpointCardData(title: "Suspected cases", image: "suspect", color: Color("suspected")),
        Endpoint.cases: EndpointCardData(title: "Confirmed cases", image: "fever", color: Color("confirmed")),
        Endpoint.cases: EndpointCardData(title: "Deaths", image: "death", color: Color("death")),
        Endpoint.cases: EndpointCardData(title: "Recovered", image: "patient", color: Color("recovered")),
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
                Image(systemName: image)
                Spacer()
                Text(cases)
            }
            .font(.largeTitle)
        }
        .padding()
        .foregroundColor(color)
    }
}

//struct EndpointCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            EndpointCardView()
//                .environment(\.colorScheme, .dark)
//            EndpointCardView()
//                .environment(\.colorScheme, .light)
//        }
//    }
//}
