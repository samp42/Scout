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
    @EnvironmentObject var dayTeams: DayTeams
    
    let tab: Int
    var detailsView: AnyView
    var title: String
    
    var body: some View {
        NavigationView{
            List {
                ForEach(0..<16) {i in
                    NavigationLink(destination: self.detailsView) {
                        switch(tab) {
                        case 1:
                            switch(dayTeams.dayTeams) {
                            case day1Teams:
                                SheetsListCellView(team: day1Teams[i])
                            case day2Teams:
                                SheetsListCellView(team: day2Teams[i])
                            default:
                                SheetsListCellView(team: day3Teams[i])
                            }
                        case 2:
                            switch(dayTeams.dayTeams) {
                            case day1Teams:
                                StatisticsListCellView(team: day1Teams[i])
                            case day2Teams:
                                StatisticsListCellView(team: day2Teams[i])
                            default:
                                StatisticsListCellView(team: day3Teams[i])
                            }
                        default:
                            switch(dayTeams.dayTeams) {
                            case day1Teams:
                                RobotListCellView(team: day1Teams[i])
                            case day2Teams:
                                RobotListCellView(team: day2Teams[i])
                            default:
                                RobotListCellView(team: day3Teams[i])
                            }
                        }
                    }
                }
            }.navigationTitle(Text(title))
        }
    }
}
