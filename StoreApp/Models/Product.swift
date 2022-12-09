//
//  Product.swift
//  StoreApp
//
//  Created by Mohammad Azam on 11/26/22.
//

import Foundation

struct Product: Codable, Hashable {
    
    var id: Int?
    let title: String
    let price: Double
    let description: String
    let images: [URL]?
    let category: Category
    
}

extension Product {
    
    static var preview: Product {
        Product(id: 1, title: "Handmade Fresh Table" , price: 687, description: "Andy shoes are designed to keeping in...", images: [URL(string: "https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1544&q=80")!], category: Category.preview)
    }
    
}
