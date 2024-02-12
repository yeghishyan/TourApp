//
//  ExplorePage.swift
//  TourApp
//
//  Created by miqo on 14.01.24.
//

import SwiftUI

struct ExplorePage: View {
    @EnvironmentObject var appVM: ApplicationVM
    
    @FocusState var focus: Int?
    @State var searchQuery: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            UserSection()
                .padding(.top, 17)
            
            SearchSection()
                .padding(.top, 17)
            
            TrendingView()
                .modelContainer(trendingContainer)
                .padding(.top, 20)
        }
        .frame(maxWidth: UIScreen.screenWidth, alignment: .leading)
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    func UserSection() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Text("Hi Jhon,")
                    .foregroundStyle(.naturalWhite)
                    .font(.appFont(size: 18, weight: .light))
                
                Spacer()
                
                Button(action: {}, label: {
                    Image("ProfileImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 32, height: 32)
                        .scaleEffect(1.6)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.5), radius: 1, y: 3)
                        .frame(width: 40, height: 40)
                        .background(.naturalWhite, in: .circle)
                })
                
                //.border(.blue)
            }
            
            Text("Where Do You \nWanna \(Text("Go?").foregroundStyle(.orange500))")
                .foregroundStyle(.naturalWhite)
                .font(.appFont(size: 32, weight: .bold))
        }
    }
    
    @ViewBuilder
    func SearchSection() -> some View {
        HStack(spacing: 10) {
            HStack(spacing: 10) {
                Image("search")
                    .resizable().renderingMode(.template)
                    .frame(width: 16, height: 16)
                
                TextField("", text: $searchQuery)
                    .placeholder(when: focus != 0 && searchQuery.isEmpty) {
                        Text("Search")
                    }
                    .font(.appFont(size: 14, weight: .regular))
                    .frame(height: 12*2 + 16)
                
                Image("microphone")
                    .resizable().renderingMode(.template)
                    .scaledToFit()
                    .frame(height: 16)
                    .padding(.vertical, 12)
            }
            .padding(.horizontal, 16)
            .focused($focus, equals: 0)
            .overlay {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(lineWidth: 1)
                        .fill(.gray200)
                }
            }
            
            Button(action: {}, label: {
                Image("settings")
                    .resizable().renderingMode(.template)
                    .frame(height: 18)
                    .padding(14)
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(lineWidth: 1)
                            .fill(.gray200)
                    }
            })
            .frame(maxWidth: 46, maxHeight: 46)
            
        }
        .foregroundStyle(.gray200)
    }

}

#Preview {
//    ExplorePage()
    HomeScreen()
        .environmentObject(ApplicationVM())
}
