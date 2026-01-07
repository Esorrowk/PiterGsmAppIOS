import SwiftUI

// главная вкладка
struct HomeView: View {
    // создаём тип данных Category, ID формируется автоматически
    struct Category: Identifiable {
        let id = UUID()
        let title: String
        let imageName: String
        let destination: AnyView
    }
    // список с картинками
    let categoryList: [Category] = [
        Category(title: "iPhone", imageName: "iPhone", destination: AnyView(IPhoneScreenView())),
        Category(title: "iPad", imageName: "iPad", destination: AnyView(IPadScreenView())),
        Category(title: "Mac", imageName: "Mac", destination: AnyView(MacScreenView())),
        Category(title: "Умные часы", imageName: "appleWatch", destination: AnyView(AppleWatchScreenView())),
        Category(title: "Аудио", imageName: "Audio", destination: AnyView(AudioScreenView())),
        Category(title: "Смартфоны", imageName: "smartphone", destination: AnyView(SmartPhoneScreenView())),
        Category(title: "Планшеты", imageName: "planshet", destination: AnyView(PlanshetScreenView())),
        Category(title: "Ноутбуки", imageName: "laptop", destination: AnyView(LaptopScreenView())),
        Category(title: "Аксессуары", imageName: "accessories", destination: AnyView(AccessoriesScreenView())),
        
    ]
    // приватная переменная для поисковой строки
    @State private var searchBar: String = ""
    
    var body: some View {
        NavigationStack {
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
                Spacer() // очистка места под
            }
            .navigationTitle("PiterGsm")
            .navigationBarTitleDisplayMode(.inline) // центрированный маленький размер шапки
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
            VStack{
                Spacer()
                Button{
                    showSearch = true
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.primary)
                        .frame(width: 56, height: 56)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                }
                .padding(.bottom, 28)
            }
        }
        .sheet(isPresented: $showSearch){
            SearchView()
        }
        .tint(.blue)
        
    }
}
    


#Preview {
    MainView()
}

