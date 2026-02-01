import SwiftUI
// профиль

struct ProfileView: View {
    @State private var login = ""
    @State private var password = ""

    var body: some View {
        ZStack {

            Image("ProfileFon")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            // Затемнение
            Color.black.opacity(0.4)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Spacer()

                TextField("login", text: $login)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 44)

                SecureField("password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 44)

                Button("Войти") {
                }
                .frame(height: 44)
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)

                Spacer()
            }
            .frame(maxWidth: 350)
            .padding()
        }
        .navigationTitle("Вход с паролем")
        .navigationBarTitleDisplayMode(.inline)
    }
}
