//
//  StatisticsListCellView.swift
//  Scout Insights
//
//  Created by Domenico Valentino on 2022-04-03.
//

import SwiftUI

struct StatisticsListCellView: View {
    var (team) : (Int)
    var body: some View {
        Text("Team \(String(team))")
    }
}

struct StatisticsListCellView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsListCellView(team: 1)
    }
}
