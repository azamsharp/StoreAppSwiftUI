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
    @Published var categories: [Category] = []
    @Published var products: [Product] = []
    
    func fetchCategories() async throws {
        categories = try await client.load(Resource(url: URL.allCategories))
    }
    
    func fetchProductsByCategory(_ categoryId: Int) async throws {
        products = try await client.load(Resource(url: URL.productsByCategory(categoryId)))
    }
    
    func saveProduct(_ createProductRequest: CreateProductRequest) async throws {
        
        let data = try JSONEncoder().encode(createProductRequest)
        let product: Product = try await client.load(Resource(url: URL.saveProduct, method: .post(data)))
        products.append(product)
        
    }
    
}
