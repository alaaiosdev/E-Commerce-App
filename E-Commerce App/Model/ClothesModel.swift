//
//  ClothesModel.swift
//  E-Commerce App
//
//  Created by Alaa Abu Taha on 2/24/20.
//  Copyright © 2020 Alaa Abu Taha. All rights reserved.
//


import SwiftUI

// MARK: - Item
struct ClothesModel: Codable {
    let price: Int
    let brandsName, imageName, brandsDescription: String
}
extension ClothesModel: Hashable {
    static func all() -> [ClothesModel] {
        return [ClothesModel(price: 0, brandsName: "", imageName: "", brandsDescription: "")]
    }
}

//Identifiable: We need Identifiable to display things in a list
//codable: We need codable to be able to map our JSON data into our model right here
//Hashable: We can use Hashable for a very efficient categorization process.
