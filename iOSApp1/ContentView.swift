import SwiftUI
// Stores coffee order information
struct CoffeeOrder: Identifiable {
    let id = UUID()
    var name: String
    var drink: String
    var size: String
}
// Main screen of the app
struct ContentView: View {

    @State private var orders: [CoffeeOrder] = []
    @State private var currentIndex = 0

    var body: some View {

        NavigationStack {

            VStack {

                if orders.isEmpty {

                    Text("No orders yet")
                        .font(.title2)
                        .padding()

                } else {

                    VStack(spacing: 20) {

                        Text(orders[currentIndex].name)
                            .font(.largeTitle)

                        Text(orders[currentIndex].size)
                            .font(.title)

                        Text(orders[currentIndex].drink)
                            .font(.title2)

                        HStack {

                            Button("Previous") {
                                if currentIndex > 0 {
                                    currentIndex -= 1
                                }
                            }

                            .padding()

                            Button("Next") {
                                if currentIndex < orders.count - 1 {
                                    currentIndex += 1
                                }
                            }

                            .padding()
                        }
                    }
                    .padding()
                }

                NavigationLink("Add Order") {
                    AddOrderView(orders: $orders)
                }
                .padding()
                .buttonStyle(.borderedProminent)

            }
            .navigationTitle("Tim Hortons")
        }
    }
}

#Preview {
    ContentView()
}
