//
//  ClothesDataObservedObject.swift
//  E-Commerce App
//
//  Created by Alaa Abu Taha on 3/7/20.
//  Copyright © 2020 Alaa Abu Taha. All rights reserved.
//

import Combine
import Foundation

class ClothesDataObservedObject: ObservableObject {
    
    @Published var clothesModel: [ClothesModel]?
    
    init() {
        load()
    }
    
    func load() {
        loadModelFromJSON("data") { (result: Result<[ClothesModel], Error>) in
            if case let .success(res) = result {
                self.clothesModel = res
            }
        }
    }
    
    func loadModelFromJSON<T: Decodable>(_ filename: String, as type: T.Type = T.self, completion: (Result<T, Error>) -> ()) {
        var data: Data
        do {
            let path = Bundle.main.path(forResource: filename, ofType: "json")!
            let fileUrl = URL(fileURLWithPath: path)
            data = try Data(contentsOf: fileUrl,options: .mappedIfSafe)
            guard let file = Bundle.main.url(forResource: filename, withExtension: "json") else {
                fatalError("Couldn’t  find \(filename) in main bundle.")
            }
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn’t  find \(filename) in main bundle:\n\(error)")
        }
        do {
            let decoder = JSONDecoder()
            let model = try decoder.decode(T.self, from: data)
            completion(.success(model))
        } catch {
            completion(.failure(error))
        }
    }
}
