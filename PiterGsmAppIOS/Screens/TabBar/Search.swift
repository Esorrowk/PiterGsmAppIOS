import SwiftUI

struct SearchView: View {
    @Environment(\.dismiss) var dismiss
    @State private var searchBar = ""

    var body: some View {
        NavigationStack {
            // создание поля ввода с привязкой в searchBar
            TextField("Поиск", text: $searchBar)
                .frame(height: 44)
                .glassEffect(.regular)
                .shadow(color: .black.opacity(0.15), radius: 20, y: 10)
                .padding()
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Закрыть") {
                            dismiss()
                        }
                    }
                }
        }
    }
}
