//
//  Frame.swift
//  CoCo
//
//  Created by Minkyu Lee on 2021/08/21.
//

import SwiftUI

struct Frame: View {
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        GeometryReader { geomtry in
            VStack {
                Text("Frame Tab")
                
                Spacer()
                TabBar(viewRouter: viewRouter)
            }
        }
    }
}

struct Frame_Previews: PreviewProvider {
    static var previews: some View {
        Frame(viewRouter: ViewRouter())
    }
}
