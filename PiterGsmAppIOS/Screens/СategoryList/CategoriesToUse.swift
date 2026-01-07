import SwiftUI
// файл для использования категорий в разных файлах

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
