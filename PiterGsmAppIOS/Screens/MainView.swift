//
//  ContentView.swift
//  PiterGsmAppIOS
//
//  Created by Egor Akentyev on 28.12.2025.
//

import SwiftUI

// главная вкладка
struct HomeView: View {
    let katalogList = [
        "iPhone","iPad","Mac","Умные часы","Аудио",
        "Смартфоны","Планшеты","Ноутбуки","Аксессуары"
    ]

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(katalogList, id: \.self) { item in
                            Text(item)
                        }
                    }
                    .padding()
                }
                Spacer()
            }
            .navigationTitle("PiterGsm")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
// каталог
struct CatalogView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Каталог")
                    .font(.title2)
                    .padding()
                Spacer()
            }
            .navigationTitle("Каталог")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
// корзина
struct BasketView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Корзина")
                    .font(.title2)
                    .padding()
                Spacer()
            }
            .navigationTitle("Корзина")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
// избранное
struct FavoritesView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Избранное")
                    .font(.title2)
                    .padding()
                Spacer()
            }
            .navigationTitle("Избранное")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
// профиль
struct ProfileView: View {
    var body: some View {
        Text("Профиль")
    }
}
// главный экран
struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Главная")
                }
            CatalogView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Каталог")
                }
            
            BasketView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Корзина")
                }
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Избранное")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Профиль")
                }
        }
        .tint(.blue)

    }
}


#Preview {
    MainView()
}

