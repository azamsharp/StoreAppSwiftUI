//
//  StoreModel.swift
//  StoreApp
//
//  Created by Mohammad Azam on 11/21/22.
//

import Foundation

@MainActor
class StoreModel: ObservableObject {
    
    let client = StoreHTTPClient()
    @Published private(set) var categories: [Category] = []
    @Published private(set) var products: [Product] = []
    
    func fetchCategories() async throws {
        categories = try await client.getCategories(url: URL.allCategories)
    }
    
    func fetchProductsByCategory(_ categoryId: Int) async throws {
        products = try await client.getProductsByCategory(url: URL.productsByCategory(categoryId))
    }
    
}
