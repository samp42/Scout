//
//  ContentView.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    @available(iOS 15.0, *)
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
