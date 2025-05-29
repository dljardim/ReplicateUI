import SwiftUI

//  https://www.kodeco.com/books/swiftui-cookbook/v1.0/chapters/11-animate-view-transitions-in-swiftui

struct ViewTransitionsContentView: View {
    @State private var showIngredients = false
    let foodItems = ["Pizza", "Burger", "Pasta"]
    @State private var selectedFood = "Pizza"
    
    var body: some View {
        VStack {
            Picker(selection: $selectedFood, label: Text("Please choose a food")) {
                ForEach(foodItems, id: \.self) {
                    Text($0)
                }
            }
            .padding()
            
            Button(action: {
                withAnimation {
                    showIngredients.toggle()
                }
            }) {
                Text(showIngredients ? "Hide Ingredients" : "Show Ingredients")
            }
            .padding()
            
            if showIngredients {
                IngredientView(food: selectedFood)
                    .transition(.move(edge: .leading))
            }
            Spacer()
        }
    }
}

struct ViewTransitionsIngredientView: View {
    let food: String
    
    var ingredients: [String] {
        switch food {
            case "Pizza": return ["Dough", "Tomato Sauce", "Cheese", "Toppings"]
            case "Burger": return ["Bun", "Patty", "Lettuce", "Tomato", "Sauce"]
            case "Pasta": return ["Pasta", "Olive oil", "Garlic", "Tomato Sauce"]
            default: return []
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(food) Ingredients:")
                .font(.headline)
                .padding(.top)
            ForEach(ingredients, id: \.self) { ingredient in
                Text(ingredient)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.blue.opacity(0.2))
        .cornerRadius(10)
    }
}
