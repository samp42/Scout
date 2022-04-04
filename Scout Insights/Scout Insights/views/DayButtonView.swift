//
//  ScanButtonView.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-03.
//

import SwiftUI

struct DayButtonView: View {
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button {
                } label: {
                    Image(systemName: "calendar.badge.plus")
                        .resizable()
                        .padding(16)
                        .foregroundColor(Color("T4K_Black"))
                        .frame(width: 60, height: 60)
                    Text("\(DAY_1)th Of April")
                        .padding(14)
                        .frame(width: 120, height: 60)
                        .foregroundColor(Color.black)
                }.background(Color("T4K_Yellow"))
                    .cornerRadius(30)
                    .shadow(color: Color("T4K_Yellow"), radius: 2, x: 2, y: 2)
                    .padding([.all, .trailing], 30)
            }
            Spacer()
        }
    }
}

@available(iOS 15.0, *)
struct DayButtonView_Preview: PreviewProvider {
    @available(iOS 15.0, *)
    static var previews: some View {
        DayButtonView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
