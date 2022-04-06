//
//  ScanButtonView.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-03.
//

import SwiftUI

struct DayButtonView: View {
    @EnvironmentObject var dayTeams: DayTeams 
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                // Other views
                switch(dayTeams.dayTeams) {
                case day1Teams:
                    Text("\(DAY_1)th of April")
                case day2Teams:
                    Text("\(DAY_2)th of April")
                default:
                    Text("\(DAY_3)th of April")
                }
                    

                // Button, that when tapped shows 3 options
                Menu {
                    ForEach(0..<3) {i in
                        Button(action: {
                            dayTeams.dayTeams = competingTeams[i]
                        }) {
                            Label("April \(7+i)", systemImage: "calendar.circle")
                        }
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
            .padding(30)
            Spacer()
        }
    }
}

@available(iOS 15.0, *)
struct DayButtonView_Preview: PreviewProvider {
    static let dayTeams = DayTeams()
    
    @available(iOS 15.0, *)
    static var previews: some View {
        DayButtonView().environmentObject(DayTeams())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
