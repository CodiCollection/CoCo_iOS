//
//  Closet.swift
//  CoCo
//
//  Created by Minkyu Lee on 2021/08/21.
//

import SwiftUI

struct Closet: View {
    @StateObject var viewRouter: ViewRouter

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0){
                HStack {
                    Text("Closet")
                        .font(Font.custom("Times New Roman", size: 28))
                        .frame(width: 100, height: 30)
                        .padding(.leading, 20)
                        .font(.system(size: 30))
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                        ZStack {
                            Text("Add")
                                .font(.system(size: 20))
                            let buttonHeight: CGFloat = 30
                            RoundedRectangle(cornerRadius: buttonHeight/2)
                                .stroke(lineWidth: 1.0)
                                .frame(width: 70, height: buttonHeight)
                        }
                        .foregroundColor(.black)

                    }
                    .padding(.trailing, 20)
                }
                .padding(.top, 5)
                .padding(.bottom, 5)
                ExDivider()
                HStack(alignment: .center) {
                    HorizontalMenu(viewRouter: viewRouter, assignedTab: .Clothes, name: "Clothes")
                    Spacer()
                    HorizontalMenu(viewRouter: viewRouter, assignedTab: .CoCo, name: "CoCo")
                    Spacer()
                    HorizontalMenu(viewRouter: viewRouter, assignedTab: .Reference, name: "Reference")
                }
                .frame(width: geometry.size.width * 0.8 , height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .offset(y: 10)
                
                Spacer()
                switch viewRouter.currentClosetTab {
                    case .Clothes:
                        Clothes(viewRouter: viewRouter)
                    case .CoCo:
                        Text("CoCo")
                    case .Reference:
                        Text("Reference")
                }
                Spacer()
                
                TabBar(viewRouter: viewRouter)
            }
//            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct Closet_Previews: PreviewProvider {
    static var previews: some View {
        Closet(viewRouter: ViewRouter())
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
            .previewDisplayName("iPhone 12 Pro")
    }
}

struct HorizontalMenu: View {
    @StateObject var viewRouter: ViewRouter
    let assignedTab: ClosetTab
    let name: String

    var body: some View {
        VStack {
            Text(name)
            ExDivider()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .padding(.vertical, -2)
        }
        .onTapGesture {
            viewRouter.currentClosetTab = assignedTab
        }
    }
}
