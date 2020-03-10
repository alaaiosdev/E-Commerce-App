//
//  HomeView.swift
//  E-Commerce App
//
//  Created by Alaa Abu Taha on 2/24/20.
//  Copyright © 2020 Alaa Abu Taha. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State private var animationAmmount: CGFloat = 1.2
    @State var showSheetView = false
    @ObservedObject var clothesDataObservedObject = ClothesDataObservedObject()
    
    // MARK: Body
    var body: some View {
        return NavigationView {
            VStack(alignment: .trailing) {
                Image("Branding")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
//                    .scaleEffect(animationAmmount)
//                    .blur(radius: (animationAmmount - 1) * 40)
                    .animation(.default)
                
                if clothesDataObservedObject.clothesModel != nil {
                    List(clothesDataObservedObject.clothesModel ?? [], id: \.self) { clothesItem in
                        HStack {
                            NavigationLink(
                            destination: ContentClothesDetails(clothes: clothesItem)) {
                                ContentClothesItem(clothes: clothesItem)
                            }
                        }
                    }}
            }
            .navigationBarTitle("Shopping Online", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {self.showSheetView.toggle()}, label: {Image(systemName: "info.circle")}).foregroundColor(Color.black)
            )
        }.sheet(isPresented: $showSheetView) {
            AboutView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        return HomeView()
        
    }
}
