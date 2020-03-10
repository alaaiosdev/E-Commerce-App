//
//  ContentClothesDetails.swift
//  E-Commerce App
//
//  Created by Alaa Abu Taha on 2/25/20.
//  Copyright © 2020 Alaa Abu Taha. All rights reserved.
//

import SwiftUI

struct ContentClothesDetails: View {
    
    var clothes: ClothesModel
    @State var pickerSelectedItem = 0
    @State private var showingSheet = false
    var sizeArr: [String] = ["S","M","L","XL","2XL","3XL","4XL","5XL"]
    var arrColor: [Color] = [Color.gray, Color.purple, Color.black, Color.pink]
    let img = Image(systemName:"person.3.fill")
    
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Image(clothes.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width-30, height: UIScreen.main.bounds.width/2)
                        .shadow(color: Color.gray, radius: 2, x: 10, y: 10)
                }
                
                HStack (spacing: 16) {
                    RectangleView(color: Color.purple)
                    RectangleView(color: Color.pink)
                    RectangleView(color: Color.black)
                    RectangleView(color: Color.gray)
                }.frame(width: UIScreen.main.bounds.width-30, alignment: .center)
                ScrollView(.horizontal, content: {
                    HStack(spacing: 10) {
                        ForEach(0..<sizeArr.count) {
                            ContentClothesSize(textSize: self.sizeArr[$0])
                        }
                    }.padding(.horizontal, 24)
                }).frame(height: 50)
                
                VStack(alignment: .leading){
                    Picker(selection: $pickerSelectedItem, label: Text("")) {
                        Text("Order now").tag(0)
                        Text("All sales").tag(1)
                        Text("Today's sales").tag(2)
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal, 24)
                    
                    TextDetailsView(text: clothes.brandsName, fontType: .title, fontWeight: .bold, foregroundColor: Color("myColor1"), padding: EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 10))
                    
                    TextDetailsView(text: "Price: \(clothes.price)€", fontType: .body, fontWeight: .regular, foregroundColor: Color.gray, padding: EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                    
                    TextDetailsView(text: clothes.brandsDescription, fontType: .body, fontWeight: .regular, foregroundColor: Color.gray, padding: EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                    
                    HStack {
                        Button(action: {
                            self.showingSheet = true
                        }) {
                            HStack {
                                Text("Add to cart")
                                    .foregroundColor(Color.white)
                                Image(systemName: "cart")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            }
                        }
                        .actionSheet(isPresented: $showingSheet) {
                            ActionSheet(title: Text("My Cart❤️"), message: Text("The product has been successfully added to cart..."), buttons: [.default(Text("Ok"))])
                        }
                        .padding(.all).background(Color(#colorLiteral(red: 0.2027422786, green: 0.1844304204, blue: 0.1266227663, alpha: 1)))
                        .cornerRadius(20)
                        
                        Image(systemName: "heart")
                            .resizable()
                            
                            .frame(width: 40, height: 40)
                            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)).background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    }
                }.padding()
            }
        }
    }
}

struct ContentClothesDetails_Previews: PreviewProvider {
    static var previews: some View {
        ContentClothesDetails(clothes: ClothesModel.all()[0])
    }
}

struct RectangleView: View {
    
    var color: Color
    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(color)
                .frame(width: 20, height: 20)
                .cornerRadius(5)
        }
    }
}

struct TextDetailsView: View {
    var text: String
    var fontType: Font
    var fontWeight: Font.Weight
    var foregroundColor: Color
    var padding: EdgeInsets
    var body: some View {
        Text(text)
            .font(fontType)
            .fontWeight(fontWeight)
            .font(Font.caption)
            .foregroundColor(foregroundColor)
            .multilineTextAlignment(.leading)
            .padding(padding)
    }
}
