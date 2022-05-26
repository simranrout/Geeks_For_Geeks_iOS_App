//
//  HeaderView.swift
//  GeeksForGeeks
//
//  Created by Simran Rout on 26/05/22.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0.0){
                Text("").foregroundColor(Color.green)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).frame(width: geometry.size.width, height: 30, alignment: .leading)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.black/*@END_MENU_TOKEN@*/)
                Text("GeeksForGeeks").foregroundColor(Color.green)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).frame(width: geometry.size.width, height: 50, alignment: .leading)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                    .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            }.ignoresSafeArea()
        }
    }
}
    
    struct HeaderView_Previews: PreviewProvider {
        static var previews: some View {
            HeaderView()
        }
    }
