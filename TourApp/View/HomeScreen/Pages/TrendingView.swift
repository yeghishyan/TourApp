//
//  TrendingView.swift
//  TourApp
//
//  Created by miqo on 14.01.24.
//

import SwiftUI
import SwiftData

struct TrendingView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [TourItem]
    
    @State var currentTrending: Int = 0
    
    var body: some View {
        ZStack {
            HStack(spacing: 5) {
                ForEach(items.indices, id:\.self) { index in
                    ZStack {
                        if currentTrending == index {
                            Circle()
                                .stroke(lineWidth: 2)
                                .foregroundColor(.orange500)
                                .frame(width: 12, height: 12)
                        }
                        
                        Circle()
                            .fill(.gray400)
                            .frame(width: 7, height: 7)
                    }
                    .onTapGesture(perform: { currentTrending = index })
                }
            }
            .offset(y: 170)
            
            ZStack {
                ForEach(Array(items.enumerated()), id:\.offset) { index, item in
                    if currentTrending <= index && index <= currentTrending + 3 {
                        TrendingItemView(
                            item: item,
                            isCurrent: (currentTrending == index)
                        ) { translation in
                            if -translation.height > 233*0.8 {
                                currentTrending = (currentTrending + 1) % items.count
                            }
                        }
                        .frame(width: 335, height: 233, alignment: .bottom)
                        .offset(y: CGFloat((index-currentTrending)*30))
                        .shadow(color: .black.opacity(0.5), radius: 2, y: 4)
                        .scaleEffect(1 - 0.1*CGFloat(index - currentTrending))
                        .zIndex(Double(items.count - (index-currentTrending)))
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .animation(.spring().speed(1.5), value: currentTrending)
    }
}

struct TrendingItemView: View {
    var item: TourItem
    var isCurrent: Bool
    
    var onSwipe: (CGSize) -> Void
    
    @State private var translation: CGSize = .zero
    @State private var motionOffset: Double = 0.0
    
    let rotationLimit: CGFloat = 40
        
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ZStack {
                    Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(.rect(cornerRadius: 32))
                }
                .padding(isCurrent ? 3 : 0)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottom)
                .background(.ultraThinMaterial, in: .rect(cornerRadius: 32))
                .overlay {
                    RoundedRectangle(cornerRadius: 32)
                        .stroke(lineWidth: 1)
                        .fill(isCurrent ? .clear : .naturalWhite)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .opacity(0.7)
                }
                
//                if isCurrent {
//                    LinearGradient(colors: [.black.opacity(0.89), .black.opacity(0.3), .clear],
//                                   startPoint: .bottom, endPoint: .center)
//                }
            }
            .clipShape(.rect(cornerRadius: 32))
            
            .rotationEffect(
                .degrees(Double(self.translation.width / geometry.size.width * rotationLimit)),
                anchor: .bottom
            )
            .offset(x: self.translation.width, y: self.translation.height)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        if !isCurrent { return }
                        self.translation = gesture.translation
                        //print("translation : \(translation)")
                    }
                    .onEnded { gesture in
                        if !isCurrent { return }
                                                
                        onSwipe(translation)
                        self.translation = .zero
                    }
            )
        }
        .animation(.default, value: translation)
    }
}

#Preview {
    ZStack {
        //Color.white
        Color.gray900
            .ignoresSafeArea()
        
        TrendingView()
            .modelContainer(trendingContainer)
    }
}
