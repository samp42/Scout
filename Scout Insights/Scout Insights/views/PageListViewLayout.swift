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
    
    var body: some View {
        NavigationView{
            List {
                ForEach(0..<16) {i in
                    NavigationLink(destination: self.detailsView) {
                        RobotListCellView(
                            team: day1Teams[i])
                        )
                    }
                }
            }.navigationTitle(Text("Teams"))
        }
    }
}
