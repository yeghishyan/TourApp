//
//  HomeVM.swift
//  TourApp
//
//  Created by miqo on 14.01.24.
//

import SwiftUI

class HomeVM: ObservableObject {
    enum TabItem: String, CaseIterable, Hashable {
        case explore
        case calendar
        case favorites
        case account
        
        var id: Int { self.hashValue }
        
        var name: String { self.rawValue.capitalized }
        
        var icon: String {
            switch self {
            case .explore:      return "explore"
            case .calendar:     return "calendar"
            case .favorites:    return "hearth"
            case .account:      return "user"
            }
        }
    }
    
    @Published var selectedTab: TabItem = .explore
}
