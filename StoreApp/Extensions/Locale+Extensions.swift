//
//  Locale+Extensions.swift
//  StoreApp
//
//  Created by Mohammad Azam on 11/27/22.
//

import Foundation

extension Locale {
    
    static var currencyCode: String {
        Locale.current.currency?.identifier ?? "USD"
    }
    
}
