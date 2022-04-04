//
//  PageListViewLayout.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-03.
//

import CodeScanner
import SwiftUI

/**
 template view for each page
 pass a list view with a details view
 */
struct PageListViewLayout: View {
    let tab: Int
    var detailsView: AnyView
    var title: String
    
    var body: some View {
        NavigationView{
            List {
                ForEach(0..<16) {i in
                    NavigationLink(destination: self.detailsView) {
                        if (tab == 1) {
                            RobotListCellView(team: day1Teams[i])
                        }
                        if (tab == 2) {
                            StatisticsListCellView(team: day1Teams[i])
                        }
                    }
                }
            }.navigationTitle(Text(title))
        }
    }
}
