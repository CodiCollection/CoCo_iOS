//
//  Calender.swift
//  CoCo
//
//  Created by Minkyu Lee on 2021/08/21.
//

import SwiftUI

struct Calender: View {
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        GeometryReader { geomtry in
            VStack {
                Text("Calender Tab")
                
                Spacer()
                
                TabBar(viewRouter: viewRouter)
            }
        }
    }
}

struct Calender_Previews: PreviewProvider {
    static var previews: some View {
        Calender(viewRouter: ViewRouter())
    }
}
