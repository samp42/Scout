//
//  ContentView.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-01.
//

import CodeScanner
import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var isShowingScanner = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        
        
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
