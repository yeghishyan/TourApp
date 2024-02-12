//
//  CategoryItem.swift
//  TourApp
//
//  Created by miqo on 28.01.24.
//

import SwiftUI
import Foundation
import SwiftData

@Model
final class CategoryItem {
    @Attribute(.unique)
    var name: String
    
    @Relationship(deleteRule: .nullify, inverse: \TourItem.category)
    var items: [TourItem]
    
    init(name: String, items: [TourItem]) {
        self.name = name
        self.items = items
    }
}
