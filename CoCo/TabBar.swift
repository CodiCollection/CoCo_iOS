//
//  TabBar.swift
//  CoCo
//
//  Created by Min-Kyu Lee on 2021/09/05.
//

import SwiftUI

struct TabBar: View {
    @StateObject var viewRouter: ViewRouter
    let screenWidth: CGFloat = UIScreen.main.bounds.width

    var body: some View {
        let tabBarIconWidth: CGFloat = screenWidth/5
        let tabBarIconHeight: CGFloat = screenWidth/10

        VStack {
            ExDivider()

            HStack(alignment:.bottom) {

                TabBarIcon(viewRouter: viewRouter, assignedPage: .Favorite, width: tabBarIconWidth, height: tabBarIconHeight, imageName: "favorite_button_0", tabName: "Favorite")
                TabBarIcon(viewRouter: viewRouter, assignedPage: .Frame, width: tabBarIconWidth, height: tabBarIconHeight, imageName: "views_0", tabName: "Frame")
                TabBarIcon(viewRouter: viewRouter, assignedPage: .Calender, width: tabBarIconWidth, height: tabBarIconHeight, imageName: "cal_0", tabName: "Calender")
                TabBarIcon(viewRouter: viewRouter, assignedPage: .Closet, width: tabBarIconWidth, height: tabBarIconHeight, imageName: "closet_0", tabName: "Closet")
                ZStack {
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .Profile, width: tabBarIconWidth, height: tabBarIconHeight, imageName: "ex_profile", tabName: "Profile")
                    Circle()
                        .stroke(Color.black, lineWidth: 2)
                        .foregroundColor(.clear)
                        .frame(width: screenWidth/10, height: screenWidth/10)
                }
                
                    
            }
            .frame(width: screenWidth, height: screenWidth/6)
            .background(Color.black.opacity(0))
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(viewRouter: ViewRouter())
    }
}


struct TabBarIcon: View {
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    
    let width, height: CGFloat
    let imageName, tabName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
        }
        .padding(.horizontal, -4)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
            print("hi!")
        }
    }
}

struct MiddleTabBarIcon: View {
    let width, height: CGFloat
    let imageName, tabName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)

            Spacer()
        }
        
        .padding(.horizontal, -4)
        .offset(y: -20)
    }
}
