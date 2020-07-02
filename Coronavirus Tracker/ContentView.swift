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
            ZStack {
                Color.red.edgesIgnoringSafeArea(.all)
                List {
                    ForEach(1...5, id: \.self) { list in
                        ListItemView()
                    }
                }
                .navigationBarTitle("Coronavirus Tracker")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
