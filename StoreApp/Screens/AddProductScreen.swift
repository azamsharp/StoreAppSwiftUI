//
//  AddProductScreen.swift
//  StoreApp
//
//  Created by Mohammad Azam on 11/29/22.
//

import SwiftUI

struct AddProductScreen: View {
    
    @State private var title: String = ""
    @State private var price: Double = 0.0
    @State private var description: String = ""
    @State private var selectedCategory: Category?
    @State private var imageUrl: String = ""
    @State private var errorMessage: String = ""
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var storeModel: StoreModel
    
    private var isFormValid: Bool {
        !title.isEmpty && selectedCategory != nil && !imageUrl.isEmpty && !description.isEmpty && !price.isZero
    }
    
    private func saveProduct() {
        
        guard let category = selectedCategory,
        let imageURL = URL(string: imageUrl)
        else {
            return
        }
        
        let createProductRequest = CreateProductRequest(title: title, price: price, description: description, categoryId: category.id, images: [imageURL])
        
        Task {
            do {
                try await storeModel.saveProduct(createProductRequest)
                dismiss()
            } catch {
                errorMessage = "Unable to save product."
            }
        }
        
    }
    
    var body: some View {
        Form {
            TextField("Enter title", text: $title)
            TextField("Enter price", value: $price, format: .number)
            TextField("Enter description", text: $description)
            
            Picker("Categories", selection: $selectedCategory) {
                ForEach(storeModel.categories, id: \.id) { category in
                    Text(category.name)
                }
            }.pickerStyle(.wheel)
            
            TextField("Image url", text: $imageUrl)
        }.navigationTitle("Add Product")
            .onAppear {
                selectedCategory = storeModel.categories.first
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        if isFormValid {
                            saveProduct()
                        }
                    }.disabled(!isFormValid)
                }
            }
    }
}

struct AddProductScreen_Previews: PreviewProvider {
    static var previews: some View {
        let storeModel = StoreModel()
        storeModel.categories = [Category(id: 1, name: "Clothes", image: URL(string: "https://api.lorem.space/image/fashion?w=640&h=480&r=3741")!), Category(id: 2, name: "Electronics", image: URL(string: "https://api.lorem.space/image/watch?w=640&h=480&r=2817")!)]
        
        return NavigationStack {
            AddProductScreen().environmentObject(storeModel)
        }
    }
}
