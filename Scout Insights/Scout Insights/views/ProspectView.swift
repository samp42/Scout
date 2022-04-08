//
//  ProspectView.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-06.
//

import SwiftUI
import CodeScanner

struct ProspectView: View {
    @ObservedObject var scanningData: ScanningData
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func handleScan(result: Result<ScanResult, ScanError>){
        scanningData.showScanner = false
        
    }
}

struct ProspectView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectView(scanningData: ScanningData())
    }
}
