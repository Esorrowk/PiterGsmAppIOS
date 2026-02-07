import SwiftUI

struct ProfileView: View {

    @State private var login = ""
    @State private var password = ""

    var body: some View {

        ZStack {

            // Фоновая картинка
            Image("ProfileFon")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()        // заходит под safe area

            // Затемнение поверх картинки
            Color.black.opacity(0.4)
                .ignoresSafeArea()

            // Вертикальный стек с элементами
            VStack(spacing: 16) {
                Spacer() // отталкивает контент вниз

                // Поле ввода логина
                customTextField(
                    placeholder: "Логин",
                    text: $login,        // биндинг к @State login
                    isSecure: false      // обычное поле
                )

                // Поле ввода пароля
                customTextField(
                    placeholder: "Пароль",
                    text: $password,     // биндинг к @State password
                    isSecure: true       // SecureField (скрытый ввод)
                )

                // Кнопка входа
                Button("Войти") {
                    // Здесь будет логика авторизации
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(14)
                .shadow(radius: 4)

                Spacer() // отталкивает контент вверх
            }
            .frame(maxWidth: 350) // ограничиваем ширину формы
            .padding()
        }

        // Заголовок экрана в NavigationStack
        .navigationTitle("Вход с паролем")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Кастомное текстовое поле
    // Один метод — единый стиль для всех полей
    @ViewBuilder
    private func customTextField(
        placeholder: String,           // текст подсказки
        text: Binding<String>,          // привязка к @State
        isSecure: Bool                 // обычное поле или пароль
    ) -> some View {

        // Group нужен, чтобы вернуть один View
        // несмотря на if / else
        Group {
            if isSecure {
                // Поле для пароля (символы скрыты)
                SecureField(placeholder, text: text)
            } else {
                // Обычное текстовое поле
                TextField(placeholder, text: text)
            }
        }
        .padding()                         // внутренние отступы
        .frame(height: 50)                // фиксированная высота
        .background(Color.white.opacity(0.9)) // светлый фон
        .cornerRadius(14)                 // закругление углов
        .shadow(radius: 3)                // лёгкая тень
    }
}
