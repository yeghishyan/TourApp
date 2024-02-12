//
//  InitialView.swift
//  TourApp
//
//  Created by miqo on 14.01.24.
//

import SwiftUI

struct InitialScreen: View {
    @StateObject var appVM = ApplicationVM()
    
    var body: some View {
        ZStack {
            switch appVM.state {
            case .splash:
                SplashScreen()
            case .onboarding:
                OnboardingScreen()
            case .home:
                HomeScreen()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                appVM.state = .onboarding
            })
        }
        .environmentObject(appVM)
    }
    
    @ViewBuilder
    func SplashScreen() -> some View {
        Image("Splash")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
            .ignoresSafeArea()
    }
}

#Preview {
    InitialScreen()
}
