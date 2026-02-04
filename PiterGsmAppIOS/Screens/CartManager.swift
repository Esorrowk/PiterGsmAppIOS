import SwiftUI

@Observable
final class CartManager {
    var items: [Product] = []
    
    func addToCart(product: Product) {
        items.append(product)
    }
    
    func removeToCart(product: Product) {
        if let index = items.firstIndex(of: product) {
            items.remove(at: index)
        }
    }
}

