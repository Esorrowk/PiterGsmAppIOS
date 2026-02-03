import SwiftUI
//
struct NewItemScrollPanel: View {
    // модель данных для новинок
    struct NewItemScroll: Identifiable {
        let id = UUID()
        let imageName: String
    }
    
    // список новинок
    let newItemScrollList: [NewItemScroll] = [
        NewItemScroll(imageName: "NewMac"),
        NewItemScroll(imageName: "NewIPhonePro"),
        NewItemScroll(imageName: "NewIPhoneAir"),
        NewItemScroll(imageName: "NewIPhone17")
    ]
    
    // текущая картинка
    @State private var currentIndex = 0
    
    var body: some View {
        ZStack {
            // картинка
            Image(newItemScrollList[currentIndex].imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 250)
                .frame(maxWidth: .infinity)
                .clipped()
            
            // стрелки поверх картинки
            HStack {
                Button(action: {
                    if currentIndex > 0 { currentIndex -= 1 }
                }) {
                    // встроенная круглая стрелка впрво
                    Image(systemName: "chevron.left.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        // прозрачность элемента
                        .opacity(currentIndex > 0 ? 1 : 0.3)
                }
                
                Spacer()
                // всё что внутри action выполняется, когда пользователь нажимает кнопку
                Button(action: {
                    // currentIndex - переменная, которая хранит в себе показ текущей картинки
                    if currentIndex < newItemScrollList.count - 1 { currentIndex += 1 }
                }) {
                    // встроенная круглая стрелка впрво
                    Image(systemName: "chevron.right.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .opacity(currentIndex < newItemScrollList.count - 1 ? 1 : 0.3)
                }
            }
            .padding(.horizontal, 20)
        }
        .frame(height: 320)
    }
}
