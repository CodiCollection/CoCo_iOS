//
//  Favorite.swift
//  CoCo
//
//  Created by Minkyu Lee on 2021/08/16.
//

import SwiftUI

struct Favorite: View {
    @StateObject var viewRouter: ViewRouter

    var body: some View {
        GeometryReader { geometry in
            let boxWidth: CGFloat = ( geometry.size.width - 50 ) / 2
            let boxHeight: CGFloat = ( geometry.size.height ) / 9
            VStack(alignment: .center, spacing: 0){
                HStack {
                    Text("Favorite")
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
                    .position(x: 195)
                Spacer()
                VStack(spacing: 10){
                    HStack {
                        ClothesBox(content: "모자\n머리장식", width: boxWidth, height: boxHeight)
                        HStack{
                            Text("메모\nDate\nCodi name")
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                                .foregroundColor(.gray)
                        }
                        .frame(width: boxWidth, height: boxHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color(red: 0.9, green: 0.9, blue: 0.9).shadow(color: .gray, radius: 3, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 4))
                        .multilineTextAlignment(.trailing)
                        .offset(x: 20, y: 0)

                    }
                    HStack {
                        ClothesBox(content: "상의", width: boxWidth, height: boxHeight * 2)
                        ClothesBox(content: "외투\n가방\n시계, 팔찌\n넥타이\n액세서리", width: boxWidth, height: boxHeight * 2)
                    }
                    HStack(alignment: .bottom) {
                        ClothesBox(content: "하의\n치마", width: boxWidth, height: boxHeight * 3)
                        ClothesBox(content: "양말\n스타킹", width: boxWidth, height: boxHeight * 2)
                    }
                    HStack(alignment: .center) {
                        ClothesBox(content: "신발", width: boxWidth, height: boxHeight)
                            .offset(x: -10)
                        
                        HStack(spacing: 10) {
                            VStack(spacing: 10){
                                CircleButton(imageName: "delete")
                                CircleButton(imageName: "capture")
                            }
                            VStack(spacing: 10){
                                CircleButton(imageName: "random")
                                CircleButton(imageName: "scrap_0")
                            }
                        }
                        .padding(.leading, 70)
                    }
                }
                TabBar(viewRouter: viewRouter)

            }
//            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct Favorite_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Favorite(viewRouter: ViewRouter())
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
                .previewDisplayName("iPhone 12 Pro")
        }
    }
}

struct ClothesBox: View {
    let content: String
    let width, height: CGFloat
    var body: some View {
        Text(content)
            .foregroundColor(Color(hue: 1.0, saturation: 0.026, brightness: 0.742))
            .frame(width: width, height: height)
            .background(RoundedRectangle(cornerRadius: 5).stroke(style: StrokeStyle(lineWidth: 1, dash: [2])))
            .multilineTextAlignment(.center)
    }
}

struct CircleButton: View {
    let imageName: String
    var body: some View {
        Button(action: {
            print("hi!")
        }) {
            Circle()
                .frame(width: 35, height: 35)
                .shadow(color: .gray, radius: 2, x: 0, y: 4)
                .overlay(Image(imageName).resizable().aspectRatio(contentMode: .fit))
        }
    }
}
