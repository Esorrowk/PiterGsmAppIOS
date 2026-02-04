//
//  PiterGsmAppIOSApp.swift
//  PiterGsmAppIOS
//
//  Created by Egor Akentyev on 28.12.2025.
//

import SwiftUI

@main
struct PiterGsmAppIOSApp: App {
    @State private var favoritesManager = FavoritesManager()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(favoritesManager) // передаем в окружение
        }
    }
}
