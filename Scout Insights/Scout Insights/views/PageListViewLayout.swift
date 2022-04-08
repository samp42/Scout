//
//  PageListViewLayout.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-03.
//

import SwiftUI

struct PageListViewLayout: View {
    @EnvironmentObject var appState: AppState
    
    let tab: Int
    var title: String
    
    var body: some View {
        NavigationView{
            List {
                ForEach(appState.teams, id: \.self) {team in
//                    NavigationLink(destination: self.detailsView(team)) {
                        SheetsListCellView(team: team)
//                    }
                }
            }.navigationTitle(Text(title))
        }
    }
}
