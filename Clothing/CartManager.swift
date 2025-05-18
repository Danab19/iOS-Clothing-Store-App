import Foundation

class CartManager: ObservableObject {
    @Published var products: [Product] = [] {
        didSet {
            saveCart()
        }
    }
    
    @Published var quantities: [UUID: Int] = [:] {
        didSet {
            saveCart()
            recalculateTotal()
        }
    }
    
    @Published var total: Int = 0 {
        didSet {
            saveTotal()
        }
    }

    private let cartKey = "cartKey"
    private let quantitiesKey = "quantitiesKey"
    private let totalKey = "totalKey"

    init() {
        loadCart()
    }

    func addToCart(product: Product) {
        if let currentQuantity = quantities[product.id] {
            quantities[product.id] = currentQuantity + 1
        } else {
            products.append(product)
            quantities[product.id] = 1
        }
        recalculateTotal()
    }

    func removeFromCart(product: Product) {
        if let currentQuantity = quantities[product.id], currentQuantity > 1 {
            quantities[product.id] = currentQuantity - 1
        } else if let index = products.firstIndex(where: { $0.id == product.id }) {
            products.remove(at: index)
            quantities[product.id] = nil
        }
        recalculateTotal()
    }

    func increment(product: Product) {
        addToCart(product: product)
    }

    func decrement(product: Product) {
        removeFromCart(product: product)
    }

    private func recalculateTotal() {
        total = products.reduce(0) { result, product in
            result + (quantities[product.id] ?? 0) * product.price
        }
    }

    private func saveCart() {
        do {
            let encodedProducts = try JSONEncoder().encode(products)
            UserDefaults.standard.set(encodedProducts, forKey: cartKey)
            
            let encodedQuantities = try JSONEncoder().encode(quantities)
            UserDefaults.standard.set(encodedQuantities, forKey: quantitiesKey)
        } catch {
            print("Failed to save cart: \(error)")
        }
    }

    private func saveTotal() {
        UserDefaults.standard.set(total, forKey: totalKey)
    }

    private func loadCart() {
        if let savedProductsData = UserDefaults.standard.data(forKey: cartKey),
           let savedProducts = try? JSONDecoder().decode([Product].self, from: savedProductsData) {
            products = savedProducts
        }

        if let savedQuantitiesData = UserDefaults.standard.data(forKey: quantitiesKey),
           let savedQuantities = try? JSONDecoder().decode([UUID: Int].self, from: savedQuantitiesData) {
            quantities = savedQuantities
        }

        if let savedTotal = UserDefaults.standard.value(forKey: totalKey) as? Int {
            total = savedTotal
        }

        recalculateTotal()
    }
}
