import SwiftUI

// This structure stores one Tim Hortons order
struct CoffeeOrder: Identifiable {
    let id = UUID()
    var name: String
    var drink: String
    var size: String
    var cream: Int
    var sugar: Int
}

struct ContentView: View {

    // Stores all saved orders
    @State private var orders: [CoffeeOrder] = []

    // Controls which order is currently displayed
    @State private var currentIndex = 0

    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {

                if orders.isEmpty {
                    Text("No orders yet")
                        .font(.title2)
                        .foregroundColor(.gray)
                } else {
                    VStack(spacing: 15) {
                        Text(orders[currentIndex].name)
                            .font(.largeTitle)
                            .bold()

                        Text("\(orders[currentIndex].size) \(orders[currentIndex].drink)")
                            .font(.title2)

                        Text("\(orders[currentIndex].cream) Cream, \(orders[currentIndex].sugar) Sugar")
                            .font(.headline)

                        HStack {
                            Button("Previous") {
                                if currentIndex > 0 {
                                    currentIndex -= 1
                                }
                            }
                            .buttonStyle(.bordered)

                            Button("Next") {
                                if currentIndex < orders.count - 1 {
                                    currentIndex += 1
                                }
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                    .padding()
                }

                NavigationLink("Add Order") {
                    AddOrderView(orders: $orders, currentIndex: $currentIndex)
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            .navigationTitle("Tim Hortons")
        }
    }
}

#Preview {
    ContentView()
}
