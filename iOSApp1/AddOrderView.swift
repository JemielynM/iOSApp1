import SwiftUI
// Screen for adding a new order
struct AddOrderView: View {
    
    @Binding var orders: [CoffeeOrder]
    
    @State private var name = ""
    @State private var drink = "Coffee"
    @State private var size = "Medium"
    
    let drinks = ["Coffee", "Tea", "Iced Capp", "Hot Chocolate"]
    let sizes = ["Small", "Medium", "Large"]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        Form {
            
            TextField("Team member name", text: $name)
            
            Picker("Drink", selection: $drink) {
                ForEach(drinks, id: \.self) { drink in
                    Text(drink)
                }
            }
            
            Picker("Size", selection: $size) {
                ForEach(sizes, id: \.self) { size in
                    Text(size)
                }
            }
            
            Button("Save Order") {
                print("Save button tapped")
                
                if !name.isEmpty {
                    let newOrder = CoffeeOrder(
                        name: name,
                        drink: drink,
                        size: size
                    )
                    
                    
                    orders.append(newOrder)
                    dismiss()
                }
            }
            .navigationTitle("Add Order")
        }
    }
}
