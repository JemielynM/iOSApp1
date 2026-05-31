import SwiftUI

struct AddOrderView: View {

    // Allows this screen to add orders to the main screen
    @Binding var orders: [CoffeeOrder]
    @Binding var currentIndex: Int

    @State private var name = ""
    @State private var drink = "Coffee"
    @State private var size = "Medium"
    @State private var cream = 1
    @State private var sugar = 1

    let drinks = ["Coffee", "Tea", "Iced Capp", "Hot Chocolate"]
    let sizes = ["Small", "Medium", "Large"]

    @Environment(\.dismiss) var dismiss

    var body: some View {
        Form {
            Section("Team Member") {
                TextField("Name", text: $name)
            }

            Section("Order Details") {
                Picker("Drink", selection: $drink) {
                    ForEach(drinks, id: \.self) {
                        Text($0)
                    }
                }

                Picker("Size", selection: $size) {
                    ForEach(sizes, id: \.self) {
                        Text($0)
                    }
                }

                Stepper("Cream: \(cream)", value: $cream, in: 0...4)
                Stepper("Sugar: \(sugar)", value: $sugar, in: 0...4)
            }

            Button("Save Order") {
                if !name.isEmpty {
                    let newOrder = CoffeeOrder(
                        name: name,
                        drink: drink,
                        size: size,
                        cream: cream,
                        sugar: sugar
                    )

                    orders.append(newOrder)
                    currentIndex = orders.count - 1
                    dismiss()
                }
            }
        }
        .navigationTitle("Add Order")
    }
}
