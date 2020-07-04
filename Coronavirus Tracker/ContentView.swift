//
//  ContentView.swift
//  Coronavirus Tracker
//
//  Created by Vinoth Vino on 01/07/20.
//  Copyright © 2020 Vinoth Vino. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ListUpdatedTextView()
                ForEach(1...5, id: \.self) { list in
                    EndpointCardView(endpoint: <#Endpoint#>, value: <#Int#>)
                }
            }
            .navigationBarTitle(Text("Coronavirus Tracker"))
        }.foregroundColor(Color.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
