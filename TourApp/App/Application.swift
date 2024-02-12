//
//  TourAppApp.swift
//  TourApp
//
//  Created by miqo on 14.01.24.
//

import SwiftUI
import SwiftData

@main
struct Application: App {
    var body: some Scene {
        WindowGroup {
            InitialScreen()
        }
    }
}

@MainActor
let trendingContainer: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: TourItem.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        
        (1...5).forEach({
            container.mainContext.insert(TourItem(image: "tavush_\($0)"))
        })
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()

@MainActor
let categoryContainer: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: CategoryItem.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        
        let items = (1...5).map({ TourItem(image: "tavush_\($0)")})
        
        (1...5).forEach({
            container.mainContext.insert( CategoryItem(name: "Category \($0)", items: items))
        })
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
