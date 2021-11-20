//
//  ViewRouter.swift
//  CoCo
//
//  Created by Minkyu Lee on 2021/08/08.
//

import SwiftUI

class ViewRouter: ObservableObject {
    // 앱 켰을 때 초기화면 설정
    @Published var currentPage: Page = .Favorite
    @Published var currentClosetTab: ClosetTab = .Clothes
//    @Published var currentClothes: ClothesList = .Blank
    @Published var isTutorial: Bool = true
    @Published var currentCategory: ClothesCategory = .Blank
}

enum Page {
    case Favorite
    case Frame
    case Calender
    case Closet
    case Profile
}

enum ClosetTab {
    case Clothes
    case CoCo
    case Reference
}

enum ClothesCategory {
    case Blank
    case Head
    case Full
    case Upper
    case Outer
    case Bag
    case Lower
    case Socks
    case Shoes
}
