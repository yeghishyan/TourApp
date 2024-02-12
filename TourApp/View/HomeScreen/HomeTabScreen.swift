//
//  HomeTabScreen.swift
//  TourApp
//
//  Created by miqo on 14.01.24.
//

import SwiftUI

struct HomeTabScreen<Content: View>: View {
    let tabs: [HomeVM.TabItem]
    
    @Binding var selection: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                ForEach(tabs.indices, id: \.self) { index in
                    content(index)
                        .tag(index)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        .background(Color.gray900)
                }
            }
            
            HStack(spacing: 0) {
                ForEach(tabs.indices, id: \.self) { index in
                    Button {
                        self.selection = index
                    } label: {
                        TabItemView(item: tabs[index], isSelected: (index == selection))
                    }
                }
            }
            .frame(width: UIScreen.screenWidth-40, height: 60)
            .overlay {
                RoundedRectangle(cornerRadius: 32)
                    .stroke(lineWidth: 1)
                    .fill(.gray800)
            }
            .padding(.bottom, 44)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .top)
        //.background(Color.gray900)
    }
}

struct TabItemView: View {
    let item: HomeVM.TabItem
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Image(item.icon)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
            }
            .frame(width: 24, height: 24)
        
            Text(item.name)
                .font(.appFont(size: 10, weight: .medium))
        }
        .frame(width: 90, height: 49)
        .animation(.default.speed(2), value: isSelected)
        .foregroundColor(isSelected ? .orange500 : .gray400)
    }
}

#Preview {
    HomeScreen()
        .environmentObject(ApplicationVM())
}
