//
//  Clothes.swift
//  CoCo
//
//  Created by Minkyu Lee on 2021/08/21.
//

import SwiftUI

struct Clothes: View {
    @StateObject var viewRouter: ViewRouter
    let boxWidth: CGFloat = UIScreen.main.bounds.size.width / 4 - 10
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 80), spacing: 5)]
    
    @Environment(\.managedObjectContext) var managedObjectContext

    @FetchRequest(
        entity: ClothesData.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \ClothesData.name, ascending: true)]
    ) var clothesData: FetchedResults<ClothesData>

    var body: some View {
        HStack {
            VStack {
                ClothesListIcon(viewRouter: viewRouter, name: "Blank", assignedTab: .Blank)
                ClothesListIcon(viewRouter: viewRouter, name: "Head", assignedTab: .Head)
                ClothesListIcon(viewRouter: viewRouter, name: "Full", assignedTab: .Full)
                ClothesListIcon(viewRouter: viewRouter, name: "Upper", assignedTab: .Upper)
                ClothesListIcon(viewRouter: viewRouter, name: "Outer", assignedTab: .Outer)
                ClothesListIcon(viewRouter: viewRouter, name: "Bag", assignedTab: .Bag)
                ClothesListIcon(viewRouter: viewRouter, name: "Lower", assignedTab: .Lower)
                ClothesListIcon(viewRouter: viewRouter, name: "Socks", assignedTab: .Socks)
                ClothesListIcon(viewRouter: viewRouter, name: "Shoes", assignedTab: .Shoes)
//                Button(action: {
//                    let c = ClothesData(context: managedObjectContext)
//                    c.name = "cap"
//                    c.category = "cap"
//                    c.storedImage = UIImage(named:"ex_cap")?.jpegData(compressionQuality: 1)
//                    PersistenceController.shared.save()
//                }, label: {
//                    Text("add cap")
//                })
            }
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(clothesData, id:\.self) { clothes in
                        if let image = clothes.storedImage {
                            if let uiImage = UIImage(data: image) {
                                Image(uiImage: uiImage)
                            }
                        }
                    }
                }
            }
        }
        
    }
}

struct Clothes_Previews: PreviewProvider {
    static var previews: some View {
        Clothes(viewRouter: ViewRouter())
    }
}

struct ClothesListIcon: View {
    @StateObject var viewRouter: ViewRouter
    let name: String
    let assignedTab: ClothesCategory
    
    var body: some View {
        Text(name)
            .font(Font.custom("Times New Roman", size: 20))
            .onTapGesture {
                viewRouter.currentCategory = assignedTab
            }
            .frame(width: 60, height: 30, alignment: .leading)
//            .padding(.horizontal, 15.0)
    }
}

struct ClothesItem: View {
    let name: String
    
    var body: some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: UIScreen.main.bounds.size.width / 4 - 10, height: UIScreen.main.bounds.size.width / 4 - 10)
            .overlay(Rectangle().stroke(lineWidth: 1).foregroundColor(Color(.systemGray5)))
    }
}

struct NoItem: View {
    var body: some View {
        Rectangle()
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
            .frame(width: UIScreen.main.bounds.size.width / 4 - 10, height: UIScreen.main.bounds.size.width / 4 - 10)
    }
}

struct ListItem: View {
    let name: String
    var body: some View {
        Rectangle()
            .onTapGesture {
                
            }
    }
}
