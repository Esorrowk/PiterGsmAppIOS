import SwiftUI

enum InfoItem: String, CaseIterable, Identifiable {
    case warranty = "Гарантия"
    case about = "О магазине"
    case howToBuy = "Как купить"
    case tradeIn = "Trade-in"
    case sales = "Акции"
    case contacts = "Контакты"

    var id: String { rawValue }
}

struct InfoView: View {

    let items = InfoItem.allCases   // массив

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ForEach(items) { item in   // один элемент
                    NavigationLink {
                        destinationView(for: item)
                    } label: {
                        Text(item.rawValue)
                            .font(.headline)
                            .padding()
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

@ViewBuilder
private func destinationView(for item: InfoItem) -> some View {
    switch item {
    case .warranty:
        WarrantyView()
    case .about:
        AboutShopView()
    case .howToBuy:
        HowToBuyView()
    case .tradeIn:
        TradeInView()
    case .sales:
        SalesView()
    case .contacts:
        ContactsView()
    }
}

struct WarrantyView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 15){
                Text("На любой товар в салоне PiterGSM предоставляется гарантия")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.green)
                    .padding(.leading, 20)
                HStack{
                    Text("•")
                        .bold()
                        .foregroundStyle(Color.green)
                        .padding(.leading, 20)
                    Text("В нашем магазине вы можете приобрести только оригинальную фирменную продукцию от крупнейших мировых производителей.")
                        .padding(20)
                }
                HStack{
                    Text("•")
                        .bold()
                        .foregroundStyle(Color.green)
                        .padding(.leading, 20)
                    Text("Гарантийные обязательства предоставляются согласно закнону «О защите прав потребителей».")
                        .padding(20)
                }
                HStack{
                    Text("•")
                        .bold()
                        .foregroundStyle(Color.green)
                        .padding(.leading, 20)
                    Text("Мы внимательно следим за качеством товаров, работы сервиса, персонала и обслуживания.")
                        .padding(20)
                }
            }
            .navigationTitle("Гарантия")
        }
    }
}


struct AboutShopView: View {
    var body: some View {
        ScrollView{
            VStack{
                Image("AboutShop")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding(5)
                VStack{
                    Text("Мы занимаемся продажей смартфонов, планшетов, умных часов и другой электроники. У нас Вы всегда найдете оригинальную продукцию ведущих производителей электроники (Apple, Samsung, Dji и многих других брендов), а также первыми получите эксклюзивные новинки.")
                        .padding(20)
                    Text("Мы работаем с 2008 года и заслужили доверие покупателей. За это время у нас сложились партнерские отношения с ведущими производителями, что позволяет предлагать высококачественную продукцию по конкурентоспособным ценам.")
                        .padding(20)
                    Text("В интернет-магазине PiterGSM вы купите смартфон, планшет и другую электронику намного дешевле, чем в торговых сетях и розничных магазинах. Секрет низкой цены — у нас нет затрат на аренду торговых мест, зарплату персонала торговой точки и прочее. Это существенно снижает себестоимость, а значит и конечную цену в PiterGSM.")
                        .padding(20)
                }
                VStack{
                    HStack{
                        Text("18")
                            .foregroundStyle(Color.green)
                            .font(.largeTitle)
                        Text("лет с вами!")
                            .font(.largeTitle)
                    }
                    Text("------------------------------------------------")
                    Text("По данным «Яндекс», 100% покупателей вернутся к нам за новой покупкой")
                    Text("------------------------------------------------")
                }
                .padding(20)
            }
            .navigationTitle("О магазине")
        }
    }
}

struct HowToBuyView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("Как купить")
                    .font(.largeTitle)
                    .foregroundStyle(Color.green)
                    .padding()
                Text("Процедура покупки товара в нашем Интернет-магазине очень проста и состоит из нескольких шагов")
                    .padding(20)
                HStack{
                    Text("1.")
                        .font(.largeTitle)
                    Text("Оформление заказа")
                        .font(.largeTitle)
                }
                VStack(alignment: .leading){
                    Text("После выбора товара нажмите кнопку В корзину — товар добавится в вашу корзину.")
                        .padding(.top, 3)
                    Text("Далее, если вы закончили выбирать товар, нажмите кнопку ваша корзина.")
                        .padding(.top, 3)
                    Text("На странице ваша корзина будут перечислены все выбранные вами товары.")
                        .padding(.top, 3)
                    Text("В поле Количество вы можете изменить количество товара для покупки. После изменения количества товара необходимо нажать кнопку Пересчитать для пересчета итоговой суммы заказа.")
                        .padding(.top, 3)
                    Text("В колонке Действия над каждым товаром можно произвести следующие действия: либо удалить товар из корзины, либо отложить товар на будущее.")
                        .padding(.top, 3)
                    Text("Также можно ввести код скидки в соответствующее поле.")
                        .padding(.top, 3)
                }
                .padding(20)

                HStack{
                    Text("2.")
                        .font(.largeTitle)
                    Text("Оформление и подтверждение заказа")
                        .font(.largeTitle)
                }
                VStack(alignment: .leading){
                        Text("После ввода необходимой информации о доставке товара (ФИО получателя, адрес доставки, контактные данные, вариант доставки, способ оплаты и т.д) для оформления заказа вам нужно нажать кнопку Оформить заказ.")
                            .padding(.top, 3)
                        Text("Внимание! Неправильно указанный номер телефона, неточный или неполный адрес могут привести к дополнительной задержке! Пожалуйста, внимательно проверяйте ваши персональные данные при регистрации и оформлении заказа.")
                            .padding(.top, 3)
                        Text("Через некоторое время (обычно в течение часа) после оформления покупки, с вами свяжется наш менеджер по контактным данным, указанным при оформлении заказа. С менеджером можно будет согласовать точное время и сроки доставки, а также уточнить детали.")
                            .padding(.top, 3)
                        Text("В поле Количество вы можете изменить количество товара для покупки. После изменения количества товара необходимо нажать кнопку Пересчитать для пересчета итоговой суммы заказа.")
                            .padding(.top, 3)
                        Text("Примечание: Для постоянных клиентов на сайте магазина есть Регистрация. В своем кабинете вы можете просмотреть содержимое корзины, историю своих заказов, а также повторить или отказаться от заказа, подписаться на рассылку новостей магазина.")
                            .padding(.top, 3)
                    }
                    .padding(20)
                HStack{
                    Text("3.")
                        .font(.largeTitle)
                    Text("Оплата и цены")
                        .font(.largeTitle)
                }
                VStack(alignment: .leading){
                    Text("Цены, указанные на сайте, являются окончательными и не требуют доплат при стандартных условиях поставки. Все налоги включены в стоимость товара.")
                        .padding(.top, 3)
                    Text("Внимание! Для каждого отдельного заказа возможен только один способ оплаты на ваш выбор. Оплата заказа по частям различными способами невозможна.")
                        .padding(.top, 3)
                    Text("Возможные способы оплаты:")
                        .padding(.top, 3)
                    Text("Только наличный расчет")
                        .padding(.top, 10)
                        .bold(true)
                }
                .padding(20)
            }
        }
            .navigationTitle("Как купить")
    }
}

struct TradeInView: View {

    enum Brand: String, CaseIterable, Identifiable {
        case none = "Выберите бренд"
        case iPhone, iPad, AppleWatch, Macbook
        var id: Self { self }
    }
    
    let modelsWithPrices: [Brand: [String: Double]] = [
            .iPhone: [
                "iPhone 17 256Gb": 48_000,
                "iPhone 17 512Gb": 58_000,
                "iPhone 17Pro 256Gb": 72_000,
                "iPhone 17Pro Max 256Gb": 79_000
            ],
            .iPad: [
                "iPad 2025": 15_000,
                "iPad Air 13 2025": 30_000,
                "iPad Pro 11 2024": 40_000,
                "iPad Pro 13 2024": 50_000
            ],
            .AppleWatch: [
                "Apple Watch 10 42mm": 30000,
                "Apple Watch 10 46mm": 32000,
                "Apple Watch 11 42mm": 35000,
                "Apple Watch 11 46mm": 37000
            ],
            .Macbook: [
                "Macbook Air 13 M4": 120000,
                "Macbook Air 15 M4": 140000,
                "Macbook Air 13 M1": 90000,
                "Macbook Air 13 M3": 100000
            ]
        ]


    @State private var selectedBrand: Brand = .none
    @State private var selectedModel: String = "Выберите модель"
    
    var selectedPrice: Double? {
            modelsWithPrices[selectedBrand]?[selectedModel]
        }
    
    var modelsForSelectedBrand: [String] {
        modelsWithPrices[selectedBrand]?.keys.sorted() ?? []
    }
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                
                Image("TradeIn")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding(5)

                Text("Узнайте стоимость своего устройства")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()

                // Picker Бренд
                Picker("Бренд", selection: $selectedBrand) {
                    ForEach(Brand.allCases) { brand in
                        Text(brand.rawValue).tag(brand)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
                .padding(.horizontal)
                .onChange(of: selectedBrand) { newValue, oldValue in
                    selectedModel = "Выберите модель"
                }
                // Picker Модель
                Picker("Модель", selection: $selectedModel) {
                    Text("Выберите модель").tag("Выберите модель")
                    ForEach(modelsForSelectedBrand, id: \.self) { model in
                        Text(model).tag(model)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
                .padding(.horizontal)

                // Показ цены
                if let price = selectedPrice {
                    Text("Цена: \(Int(price)) ₽")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.green)
                        .padding(.top)
                } else {
                    Text("Выберите модель, чтобы узнать цену")
                        .foregroundColor(.gray)
                }

                Spacer()
            }
        }
           .padding(.top)
           .navigationTitle("Trade-in")
       }
}

struct SalesView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("Акции")
                    .font(.largeTitle)
                    .bold()
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                .padding()
                
                Text("Оставь отзыв на Яндекс.картах и получи скидку 300 рублей!")
                Text("Скрок действия акции с 01.09.2025 по 01.02.2026")
                Image("Sales")
                    .resizable()
                    .scaledToFit()
            }
            .padding()
        }
    }
}

struct ContactsView: View {
    var body: some View {
        Text("Контакты")
            .navigationTitle("Контакты")
    }
}

