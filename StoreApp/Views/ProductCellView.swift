//
//  ProductCellView.swift
//  StoreApp
//
//  Created by Mohammad Azam on 11/27/22.
//

import SwiftUI

struct ProductCellView: View {
    
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                Text(product.title)
                    .bold()
                Spacer()
                
                Text(product.price, format: .currency(code: Locale.currencyCode))
                    .borderedCaption()
                    
            }
            Text(product.description)
        }
    }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCellView(product: Product.preview)
    }
}
