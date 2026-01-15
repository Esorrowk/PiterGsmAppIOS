import SwiftUI

// главная вкладка
struct HomeView: View {

    // приватная переменная для поисковой строки
    @State private var searchBar: String = ""
    
    
    var body: some View {
        NavigationStack {
            ScrollView{
                // вертикальный контейнер для элементов - вертикальный стэк
                VStack {
                    // отображения списка с картинками
                    // контейнер с горизонтальным прокрутом и полоса прокрутки скрыта
                    ScrollView(.horizontal, showsIndicators: false) {
                        // горизонтальный контейнер для элементов - горизонтальный стэк
                        HStack(spacing: 16) {
                            // для каждого элемента вертикальный стэк с расстоянием между элементами 6
                            ForEach(categoryList) { item in
                                NavigationLink(destination: item.destination) {
                                    VStack(spacing: 6) {
                                        Image(item.imageName)
                                            .resizable() // сжатие картинки
                                            .scaledToFit() // маштабирование картинки
                                            .frame(width: 32, height: 32)
                                        Text(item.title)
                                            .font(.caption)
                                    }
                                }
                                .padding()
                                .cornerRadius(14) // скругление
                            }
                            .buttonStyle(.plain) // убираем стандартное выделение кнопки
                        }
                        .padding(.horizontal)
                    }
                    // добавление скролл панели под категории
                    NewItemScrollPanel()

                    // включаем paging для скролла по одной картинке
                    .scrollTargetLayout()
                    .scrollTargetBehavior(.paging)
                    
                    Text("Популярные товары")
                    
                    PopularItemsScrollPanel()
                    Spacer() // очистка места под
                }
                .navigationTitle("PiterGsm")
                .navigationBarTitleDisplayMode(.inline) // центрированный маленький размер шапки
            }
        }
    }
}
// главный экран
struct MainView: View {
    @State private var showSearch = false
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Главная")
                }
/* 
            CatalogView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Каталог")
                }
 */
            
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
            SearchView()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Поиск")
                }
        }
        .tint(.blue)
        
    }
}
    


#Preview {
    MainView()
}

