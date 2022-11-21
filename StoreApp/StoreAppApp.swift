//
//  StoreAppApp.swift
//  StoreApp
//
//  Created by Mohammad Azam on 11/21/22.
//

import SwiftUI

@main
struct StoreAppApp: App {
    
    @StateObject private var storeModel = StoreModel()
    
    var body: some Scene {
        WindowGroup {
            CategoryListScreen().environmentObject(storeModel)
        }
    }
}
