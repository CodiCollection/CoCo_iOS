//
//  Profile.swift
//  CoCo
//
//  Created by Minkyu Lee on 2021/08/21.
//

import SwiftUI

struct Profile: View {
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        GeometryReader { geomtry in
            VStack {
                Text("Profile Tab")
                
                Spacer() 
                TabBar(viewRouter: viewRouter)
            }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(viewRouter: ViewRouter())
    }
}
