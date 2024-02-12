//
//  HomeScreen.swift
//  TourApp
//
//  Created by miqo on 14.01.24.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var appVM: ApplicationVM
    
    @StateObject var homeVM = HomeVM()
    @State private var tabSelection: Int = 0
    
    let tabItems: [HomeVM.TabItem] = [.explore, .calendar , .favorites, .account]
    
    var body: some View {
        ZStack {
            HomeTabScreen(tabs: tabItems, selection: $tabSelection) { index in
                switch tabItems[index] {
                case .explore:
                    ExplorePage()
                case .calendar:
                    EmptyView()
                case .favorites:
                    EmptyView()
                case .account:
                    EmptyView()
                }
            }
            //.ignoresSafeArea()
            .onChange(of: tabSelection, onTabSelection)
            .highPriorityGesture(TapGesture().onEnded { _ in
                self.hideKeyboard()
            })
        }
    }
    
    func onTabSelection(_: Int, index: Int) {
        homeVM.selectedTab = tabItems[index]
    }

}

#Preview {
    HomeScreen()
        .environmentObject(ApplicationVM())
}
