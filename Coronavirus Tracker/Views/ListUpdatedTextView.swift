//
//  ListUpdatedTextView.swift
//  Coronavirus Tracker
//
//  Created by Vinoth Vino on 02/07/20.
//  Copyright © 2020 Vinoth Vino. All rights reserved.
//

import SwiftUI

struct ListUpdatedTextView: View {
    var body: some View {
        Text("Last Updated: 1/7/2020")
            .multilineTextAlignment(.center)
    }
}

struct ListUpdatedTextView_Previews: PreviewProvider {
    static var previews: some View {
        ListUpdatedTextView()
    }
}
