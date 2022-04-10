//
//  RobotDetailsView.swift
//  Scout Insights
//
//  Created by Domenico Valentino on 2022-04-03.
//

import SwiftUI

struct RobotDetailsView: View {
    let team: Int
    let sheets: [ScoutingSheet]
    
    var body: some View {
        HStack {
            VStack {
                Text("Team \(String(team))")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Text("to be done")
                Spacer()
            }
            Spacer()
        }
    }
}

struct RobotDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RobotDetailsView(team : 1, sheets: [ScoutingSheet.getMock()])
    }
}
