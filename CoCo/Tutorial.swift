//
//  Tutorial.swift
//  CoCo
//
//  Created by Min-Kyu Lee on 2021/08/29.
//

import SwiftUI

struct Tutorial: View {
    @StateObject var viewRouter: ViewRouter
    @State var tutorialOrder: Int = 0
    
    var body: some View {
        GeometryReader{ geometry in
            let rect = CGRect(x: 0, y: 0, width: geometry.size.width, height: geometry.size.height)
            ZStack {
                Rectangle()
                    .fill(Color.black.opacity(0.5))
                    .frame(width: rect.width, height: rect.height)
                    .mask(HoleShapeMask(in: rect).fill(style: FillStyle(eoFill: true)))
                switch tutorialOrder {
                case 0:
                    Text("Here is Tutorial 1Area!")
                        .foregroundColor(Color.white)
                        .padding()
                    Spacer()
                case 1:
                    Text("Here is Tutorial 2Area!")
                        .foregroundColor(Color.white)
                        .padding()
                        .onAppear(){
                            viewRouter.currentPage = Page.Frame
                        }
                default:
                    Text("default")
                }
            }
//            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
        
    }
}

struct Tutorial_Previews: PreviewProvider {
    @State var isTutorial = true
    static var previews: some View {
        Tutorial(viewRouter: ViewRouter(), tutorialOrder: 0)
    }
}

func HoleShapeMask(in rect: CGRect) -> Path {
    let circleWidth: CGFloat = 200
    let x = rect.midX - circleWidth / 2
    let y = rect.maxY - circleWidth
    
    var shape = Rectangle().path(in: rect)
    shape.addPath(Circle().path(in: CGRect(x: x, y: y, width: circleWidth, height: circleWidth)))
//    shape.addPath(Circle().path(in: CGRect(x: x-50, y: y, width: circleWidth, height: circleWidth)))
    return shape
}

struct Window: Shape {
    let size: CGSize
    func path(in rect: CGRect) -> Path {
        var path = Rectangle().path(in: rect)

        let origin = CGPoint(x: rect.midX - size.width / 2, y: rect.maxY - size.height)
        path.addRect(CGRect(origin: origin, size: size))
        return path
    }
}
    
