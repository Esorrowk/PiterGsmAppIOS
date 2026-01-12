import SwiftUI
// профиль

struct ProfileView: View {
    @State private var login = ""
    @State private var password = ""
    var body: some View {
        VStack{
            TextField("login", text : $login)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: .infinity)
                .frame(height: 30)

            
            SecureField("password", text : $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: .infinity)

            
            Button("Войти"){
            }
            .frame(maxWidth: .infinity)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .background(Color.green)
            .buttonStyle(.plain)
            .cornerRadius(10)

        }
            .navigationTitle("Вход с паролем")
            .navigationBarTitleDisplayMode(.large)

    }
}


