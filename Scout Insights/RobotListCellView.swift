//
//  RobotListCellView.swift
//  Scout Insights
//
//  Created by Domenico Valentino on 2022-04-03.
//

import SwiftUI

struct RobotListCellView: View {
    var (team) : (Int)
    var body: some View {
        Text("Team \(String(team))")
    }
    
}

struct RobotListCellView_Previews: PreviewProvider {
    static var previews: some View {
        RobotListCellView(team: 1)
    }
}
