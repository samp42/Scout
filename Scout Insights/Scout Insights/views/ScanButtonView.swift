//
//  ScanButtonView.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-03.
//

import SwiftUI

struct ScanButtonView: View {
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                Button {
                } label: {
                    Image(systemName: "qrcode.viewfinder")
                        .resizable()
                        .padding(14)
                        .foregroundColor(Color("T4K_Black"))
                        .frame(width: 60, height: 60)
                }.background(Color("T4K_Yellow"))
                    .cornerRadius(30)
                    .shadow(color: Color("T4K_Yellow"), radius: 2, x: 2, y: 2)
                    .padding([.all, .trailing], 60)
            }
        }
    }
}

@available(iOS 15.0, *)
struct ScanButtonView_Previews: PreviewProvider {
    @available(iOS 15.0, *)
    static var previews: some View {
        ScanButtonView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
