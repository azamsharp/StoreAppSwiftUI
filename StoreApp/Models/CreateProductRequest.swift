//
//  CreateProductRequest.swift
//  StoreApp
//
//  Created by Mohammad Azam on 11/29/22.
//

import Foundation

struct CreateProductRequest: Encodable {
    
    let title: String
    let price: Double
    let description: String
    let categoryId: Int
    let images: [URL]
    
}
