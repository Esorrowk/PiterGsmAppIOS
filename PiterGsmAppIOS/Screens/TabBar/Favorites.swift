import SwiftUI
// создаем менеджер избранного

@Observable // следит за состоянием
// нельзя наследовать, код работает быстрее
final class FavoritesManager {
    // храним id без дубликатов
    var favorites: Set<UUID> = []
    
    // проверка id в избранном
    func isFavorites(_ product: Product) -> Bool {
        favorites.contains(product.id)
    }
    // если продукт уже в избранном убирает, если нет, добавляет
    func toggle(_ product: Product) {
        if favorites.contains(product.id) {
            favorites.remove(product.id)
        } else {
            favorites.insert(product.id)
        }
    }
}
// избранное
struct FavoritesView: View {
    @Environment(FavoritesManager.self) private var favorites
    var products: [Product] = [] // дефолтное значение

    var body: some View {
        List {
            ForEach(products.filter {
                favorites.isFavorites($0)
            }) { product in
                Text(product.name)
            }
        }
        .navigationTitle("Избранное")
    }
}
