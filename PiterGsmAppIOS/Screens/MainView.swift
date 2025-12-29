//
//  ContentView.swift
//  PiterGsmAppIOS
//
//  Created by Egor Akentyev on 28.12.2025.
//

import SwiftUI

// главная вкладка
struct HomeView: View {
    // создаём тип данных Category, ID формируется автоматически
    struct Category: Identifiable {
        let id = UUID()
        let title: String
        let imageName: String
    }
    // список с картинками
    let categoryList: [Category] = [
        Category(title: "iPhone", imageName: "iPhone"),
        Category(title: "iPad", imageName: "iPad"),
        Category(title: "Mac", imageName: "Mac"),
        Category(title: "Умные часы", imageName: "appleWatch"),
        Category(title: "Аудио", imageName: "Audio"),
        Category(title: "Смартфоны", imageName: "smartphone"),
        Category(title: "Планшеты", imageName: "planshet"),
        Category(title: "Ноутбуки", imageName: "laptop"),
        Category(title: "Аксессуары", imageName: "accessories"),
        
    ]
    // приватная переменная для поисковой строки
    @State private var searchBar: String = ""
    var body: some View {
        NavigationStack {
            // вертикальный контейнер для элементов - вертикальный стэк
            VStack {
                // создание поля ввода с привязкой в searchBar
                TextField("Поиск", text: $searchBar)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                // отображения списка с картинками
                // контейнер с горизонтальным прокрутом и полоса прокрутки скрыта
                ScrollView(.horizontal, showsIndicators: false) {
                    // горизонтальный контейнер для элементов - горизонтальный стэк
                    HStack(spacing: 16) {
                        // для каждого элемента вертикальный стэк с расстоянием между элементами 6
                        ForEach(categoryList) { item in
                            VStack(spacing: 6) {
                                Image(item.imageName)
                                    .resizable() // сжатие картинки
                                    .scaledToFit() // маштабирование картинки
                                    .frame(width: 32, height: 32)

                                Text(item.title)
                                    .font(.caption)
                            }
                            .padding()
                            .cornerRadius(14) // скругление
                        }
                    }
                    .padding(.horizontal)
                }

                Spacer() // очистка места под
            }
            .navigationTitle("PiterGsm")
            .navigationBarTitleDisplayMode(.inline) // центрированный маленький размер шапки
        }
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

