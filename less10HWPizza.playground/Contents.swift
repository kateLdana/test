import UIKit

// Структура ингридиентов и пицц

struct Ingridient {
    var name: String
    var weight: Double
    var price: Double
    var kilocalories: Double
}

struct Pizza {
    var name: String
    var ingridients: [Ingridient]
    
    var price: Double {
        return ingridients.map { ingridient in
            ingridient.price
        }.reduce(0.0, +) * 1.3
    }
}

// Ингридиеты

let cheese = Ingridient.init(name: "Cheese", weight: 70.0, price: 100, kilocalories: 70.5)
let tomato = Ingridient.init(name: "Tomato", weight: 80.0, price: 12.1, kilocalories: 20.5)
let flour = Ingridient.init(name: "Flour", weight: 100.0, price: 5.3, kilocalories: 23.2)
let oliveOil = Ingridient.init(name: "OliveOil", weight: 30.0, price: 8.5, kilocalories: 16.0)
let basil = Ingridient.init(name: "Basil", weight: 20.0, price: 5.1, kilocalories: 3.5)
let sausage = Ingridient.init(name: "Sausage", weight: 80.0, price: 25.8, kilocalories: 120.5)

// Массив пицц

let pizza1 = Pizza.init(name: "Margarita", ingridients: [cheese, tomato, flour, oliveOil])
let pizza2 = Pizza.init(name: "Hawai", ingridients: [flour, cheese, tomato, sausage])
let pizza3 = Pizza.init(name: "Italy", ingridients: [cheese, tomato, basil, oliveOil])

let allPizza = [pizza1, pizza2, pizza3]
 
for pizza in allPizza {
    print("Pizza", pizza.name, "has price", pizza.price, "🍕")
}

// Самая дорогая пицца

let highPriceOfPizza: [Double] = allPizza.map { pizza in
  pizza.price
}
var itemMax = 0.0
for item in highPriceOfPizza {
    if item > itemMax {
        itemMax = item
    }
}
print("Самая дорогая пицца стоит \(itemMax)")

// стоимость всех пицц

var priceOfPizza = [pizza1.price, pizza2.price, pizza3.price]
let allPrice = priceOfPizza.reduce(0, +)
print("Стоимость всех пицц = \(allPrice)")

// Найти пиццу в которой есть ингридиент сыр

let findOfCheese = allPizza.filter { pizza in
    return pizza.ingridients.contains { ingridient in
        return ingridient.name == "Cheese"
    }
}

findOfCheese.forEach { pizza in
    print("Пицца \(pizza.name) содержит сыр")
}
