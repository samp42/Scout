//
//  SheetsListCellView.swift
//  Scout Insights
//
//  Created by Domenico Valentino on 2022-04-06.
//

import SwiftUI

struct SheetsListCellView: View {
    var (team) : (Int)
    var body: some View {
        Text("Team \(String(team))")
    }
}

struct SheetsListCellView_Previews: PreviewProvider {
    static var previews: some View {
        SheetsListCellView(team: 1)
    }
}
