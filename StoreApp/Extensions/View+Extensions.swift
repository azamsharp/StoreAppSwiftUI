//
//  UIView+Extensions.swift
//  StoreApp
//
//  Created by Mohammad Azam on 12/9/22.
//

import Foundation
import SwiftUI

extension View {
    
    func borderedCaption(backgroundColor: Color = .green, foregroundColor: Color = .white) -> some View {
        modifier(BorderedCaption(backgroundColor: backgroundColor, foregroundColor: foregroundColor))
    }
    
}
