//
//  OnboardingVM.swift
//  TourApp
//
//  Created by miqo on 14.01.24.
//

import SwiftUI

class OnboardingVM: ObservableObject {
    enum Screen: Int, CaseIterable {
        case first
        case second
        case third
        
        var id: Int { return self.rawValue }
        
        var image: some View {
            switch self {
            case .first:    Image("onboarding_1").resizable()
            case .second:   Image("onboarding_2").resizable()
            case .third:    Image("onboarding_3").resizable()
            }
        }
        
        var title: some View {
            switch self {
            case .first:    Text("Jobs fill your pocket, \(Text("Adventures").foregroundStyle(.orange500)) fill your soul")
            case .second:   Text("Live life with no excuses, \(Text("Travel").foregroundStyle(.orange500)) with no regret")
            case .third:    Text("The world within reach. To Travel is to \(Text("Live").foregroundStyle(.orange500))")
            }
        }
        
        var description: String {
            switch self {
            case .first:    "Travelling is the best way to learn new things, A person travels for both pleasure and knowledge."
            case .second:   "Travelling refers to a trip or a journey to some distant places. It usually refers to visiting more than one places."
            case .third:    " There is craving in every person to see the other faces of nature and to know the other people of the world."
            }
        }
    }
    
    let screens: [Screen] = [.first, .second, .third]
}
