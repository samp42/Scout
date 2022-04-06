//
//  ScanButtonView.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-03.
//

import SwiftUI

struct DayButtonView: View {
    @State var dayChosen: Int
    var body: some View {
        VStack {
            HStack {
                Spacer()
                // Other views
                Text("\(dayChosen)th of April ")

                // Button, that when tapped shows 3 options
                Menu {
                    Button(action: {
                        dayChosen = Int(DAY_1)
                    }) {
                        Label("April 7", systemImage: "calendar.circle")
                    }
                    Button(action: {
                        dayChosen = Int(DAY_2)
                    }) {
                        Label("April 8", systemImage: "calendar.circle")
                    }
                    Button(action: {
                        dayChosen = Int(DAY_3)
                    }) {
                        Label("April 9", systemImage: "calendar.circle")
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
    @available(iOS 15.0, *)
    static var previews: some View {
        DayButtonView(dayChosen: Int(DAY_1))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
