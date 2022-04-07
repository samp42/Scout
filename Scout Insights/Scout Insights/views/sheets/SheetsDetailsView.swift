//
//  SheetsDetailsView.swift
//  Scout Insights
//
//  Created by Domenico Valentino on 2022-04-06.
//

import SwiftUI

struct SheetsDetailsView: View {
    let team: Int
    var sheets: [ScoutingSheet]
    
    init(team: Int) {
        self.team = team
        self.sheets = SheetsState.scoutingSheets.filter({$0.teamNumber == team})
    }
    
    var body: some View {
        ScrollView{
            ForEach(sheets, id: \.id) { sheet in
                ScoutingSheetInfoView(scoutingSheet: sheet, matchNumber: sheet.matchNumber)
            }
        }
    }
}

@available(iOS 15.0, *)
struct SheetsDetailsView_Previews: PreviewProvider {
    @available(iOS 15.0, *)
    static var previews: some View {
        SheetsDetailsView(team: 1)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
