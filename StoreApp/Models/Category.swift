//
//  Category.swift
//  StoreApp
//
//  Created by Mohammad Azam on 11/21/22.
//

import Foundation

struct Category: Codable, Hashable {
    let id: Int
    let name: String
    let image: URL
}

extension Category {
    static var preview: Category {
        Category(id: 1, name: "Clothes", image: URL(string: "https://cdn.lorem.space/images/fashion/.cache/640x480/atikh-bana-_KaMTEmJnxY-unsplash.jpg")!)
    }
}
