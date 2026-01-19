import SwiftUI

@Observable
class CartManager {
    var items: [Product] = []
    
    func addToCart(product: Product) {
        items.append(product)
    }
}

