//
//  ContentClothesCard.swift
//  E-Commerce App
//
//  Created by Alaa Abu Taha on 2/24/20.
//  Copyright © 2020 Alaa Abu Taha. All rights reserved.
//

import SwiftUI

struct ContentClothesItem: View {
    
    var clothes: ClothesModel
    var arrColor: [Color] = [Color.gray, Color.purple, Color.black, Color.pink]
    
    var body: some View {
        VStack(alignment: .center) {
            Image(clothes.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 60))

            HStack {
                Circle()
                    .frame(width: 20.0, height: 20.0)
                    .foregroundColor(arrColor.randomElement())
                Circle()
                    .frame(width: 20.0, height: 20.0)
                    .foregroundColor(arrColor.randomElement())
                Circle()
                    .frame(width: 20.0, height: 20.0)
                    .foregroundColor(arrColor.randomElement())
                Circle()
                    .frame(width: 20.0, height: 20.0)
                    .foregroundColor(arrColor.randomElement())
            }

            Text(clothes.brandsName)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("myColor1"))
                .lineLimit(2)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))

            Text("price: \(clothes.price)€")
                .font(.body)
                .fontWeight(.regular)
                .foregroundColor(Color.black)
                .lineLimit(2)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        }.padding()

        .foregroundColor(Color("cardViewColor"))
        .shadow(radius: 70)
        .cornerRadius(40)
        .padding(10)
    }
}

struct ContentClothesCard_Previews: PreviewProvider {
    static var previews: some View {
        ContentClothesItem(clothes: ClothesModel.all()[0])
    }
}
