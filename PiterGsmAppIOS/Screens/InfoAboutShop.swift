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
                HStack{
                    Text("1.")
                        .font(.largeTitle)
                    Text("Оформление заказа")
                        .font(.largeTitle)
                }
                Text("После выбора товара нажмите кнопку В корзину — товар добавится в вашу корзину.")
                Text("Далее, если вы закончили выбирать товар, нажмите кнопку ваша корзина.")
                Text("На странице ваша корзина будут перечислены все выбранные вами товары.")
                Text("В поле Количество вы можете изменить количество товара для покупки. После изменения количества товара необходимо нажать кнопку Пересчитать для пересчета итоговой суммы заказа.")
                Text("В колонке Действия над каждым товаром можно произвести следующие действия: либо удалить товар из корзины, либо отложить товар на будущее.")
                Text("Также можно ввести код скидки в соответствующее поле.")

                HStack{
                    Text("2.")
                        .font(.largeTitle)
                    Text("Оформление и подтверждение заказа")
                        .font(.largeTitle)
                }
                HStack{
                    Text("3.")
                        .font(.largeTitle)
                    Text("Оплата и цены")
                        .font(.largeTitle)
                }
            }
        }
            .navigationTitle("Как купить")
    }
}

struct TradeInView: View {
    var body: some View {
        Text("Trade-in")
            .navigationTitle("Trade-in")
    }
}

struct SalesView: View {
    var body: some View {
        Text("Акции")
            .navigationTitle("Акции")
    }
}

struct ContactsView: View {
    var body: some View {
        Text("Контакты")
            .navigationTitle("Контакты")
    }
}

