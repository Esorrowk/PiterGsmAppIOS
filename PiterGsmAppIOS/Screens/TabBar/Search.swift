import SwiftUI

struct SearchView: View {
    @State private var searchBar = ""
    
    // Фильтрованный массив, который учитывает searchBar
    var filteredCategories: [Category] {
        if searchBar.isEmpty {
            return categoryList
        } else {
            return categoryList.filter {
                $0.title.localizedCaseInsensitiveContains(searchBar)
            }
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Поиск", text: $searchBar)
                    .frame(height: 44)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                ScrollView(.vertical, showsIndicators: true){
                    VStack{
                        ForEach(filteredCategories){item in
                            NavigationLink(destination: item.destination){
                                VStack{
                                    Text(item.title)
                                        .font(.title)
                                    Spacer()
                                }
                                .textInputAutocapitalization(.none)       // отключаем автокапс
                                .keyboardType(.default)  // язык по умолчанию
                                .disableAutocorrection(true) // отключаем автозамену
                                .keyboardType(.asciiCapable)        // клавиатура ASCII (английский)
                            }
                            .buttonStyle(.plain)
                            Divider()
                                .padding(.leading, 56)
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
}
