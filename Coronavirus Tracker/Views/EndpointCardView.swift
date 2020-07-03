//
//  ListItemView.swift
//  Coronavirus Tracker
//
//  Created by Vinoth Vino on 02/07/20.
//  Copyright © 2020 Vinoth Vino. All rights reserved.
//

import SwiftUI

struct EndpointCardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Cases")
                .font(.title)
            HStack {
                Image(systemName: "airplayaudio")
                Spacer()
                Text("10,690,566")
            }
            .font(.largeTitle)
        }
        .padding()
        .foregroundColor(Color.yellow)
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListItemView()
                .environment(\.colorScheme, .dark)
            ListItemView()
                .environment(\.colorScheme, .light)
        }
    }
}
