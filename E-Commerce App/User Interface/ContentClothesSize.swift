//
//  ContentClothesSize.swift
//  E-Commerce App
//
//  Created by Alaa Abu Taha on 2/25/20.
//  Copyright © 2020 Alaa Abu Taha. All rights reserved.
//

import SwiftUI

struct ContentClothesSize: View {
    var textSize: String
    var body: some View {        
        Text(textSize)
            .padding(.all, 10.0)
            .border(Color(red: 0.7627387643, green: 0.9354949594, blue: 0.9384287596), width: 3)
        .cornerRadius(5)
        .frame(height: 40)
    }
}

struct ContentClothesSize_Previews: PreviewProvider {
    static var previews: some View {
        ContentClothesSize(textSize: "")
    }
}
