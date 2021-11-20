//
//  ContentView.swift
//  CoCo
//
//  Created by Minkyu Lee on 2021/07/15.
//

import SwiftUI

//extension UIScreen{
//   static let screenWidth = UIScreen.main.bounds.size.width
//   static let screenHeight = UIScreen.main.bounds.size.height
//   static let screenSize = UIScreen.main.bounds.size
//}

struct ContentView: View {
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                VStack(alignment: .center, spacing: 0){
                    Spacer()
                    switch viewRouter.currentPage {
                        case .Favorite:
                            Favorite(viewRouter: viewRouter)
                        case .Frame:
                            Frame(viewRouter: viewRouter)
                        case .Calender:
                            Calender(viewRouter: viewRouter)
                        case .Closet:
                            Closet(viewRouter: viewRouter)
                        case .Profile:
                            Profile(viewRouter: viewRouter)
                    }
                    
                }
                
            }
            
        }
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
            .previewDisplayName("iPhone 12 Pro")

    }
}

struct ExDivider: View {
    let color: Color = .gray
    let width: CGFloat = 1
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .edgesIgnoringSafeArea(.horizontal)
    }
}
