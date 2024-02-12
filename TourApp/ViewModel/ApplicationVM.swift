//
//  ApplicationVM.swift
//  TourApp
//
//  Created by miqo on 14.01.24.
//

import SwiftUI

class ApplicationVM: ObservableObject {
    enum State {
        case splash
        case onboarding
        case home
    }
    
    @Published var state: State = .splash
}
