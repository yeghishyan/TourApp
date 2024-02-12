//
//  TrendingItem.swift
//  TourApp
//
//  Created by miqo on 14.01.24.
//

import SwiftUI
import Foundation
import SwiftData

@Model
final class TourItem {
    var image: String
    var name: String
    var location: String
    
    var category: CategoryItem?
    
    init(image: String) {
        self.image = image
        self.name = "_"
        self.location = "_"
    }
}
