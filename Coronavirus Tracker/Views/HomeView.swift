//
//  ContentView.swift
//  Coronavirus Tracker
//
//  Created by Vinoth Vino on 01/07/20.
//  Copyright © 2020 Vinoth Vino. All rights reserved.
//

import SwiftUI
import Combine

struct HomeView: View {
    @ObservedObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< Endpoint.allCases.count) { index in
                    EndpointCardView(endpoint: Endpoint.allCases[index], value: 52)
                }
            }
            .navigationBarTitle(Text("Coronavirus Tracker"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
