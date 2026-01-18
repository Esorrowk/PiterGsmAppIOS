import SwiftUI

struct IPhoneDetailsView: View {
    let phone: IPhone
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(phone.imageName)
                Text(phone.name)
                    .scaledToFit()
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.leading,50)
                Text(phone.description)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                    .italic()
                    .padding(.leading, 50)
                Text("\(phone.price) ₽")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 50)
                Button(action: {
                    print("Предмет \(phone.name) Добавлен в корзину")
                }){
                    Text("Добавить в корзину")
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .controlSize(.large)

            }
            .padding()
        }
        .navigationTitle(phone.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}
