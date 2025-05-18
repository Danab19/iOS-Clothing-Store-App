import SwiftUI

struct AllProducts: View {
    @EnvironmentObject var cartManager: CartManager
    var column = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
   
    @State private var selectedType: String = "All"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                   
                    Text("Products")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    
                    Picker("Filter by Type", selection: $selectedType) {
                        Text("All").tag("All")
                        Text("Shoes").tag("Shoes")
                        Text("Top").tag("Top")
                        Text("Pant").tag("Pant")
                        Text("Jacket").tag("Jacket")
                        Text("Bag").tag("Bag")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    
                    LazyVGrid(columns: column, spacing: 20) {
                        ForEach(filteredProducts, id: \.id) { product in
                            NavigationLink(destination: ProductsDetails(product: product)) {
                                ProductCard(product: product)
                                   
                            }
                        }
                    }
                    .padding()
                    
                
                    Spacer(minLength: 50)
                    
                   
                    VStack {
                        Text("Contact Us")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 5)
                        Text("Email: contact@company.com\nPhone: 123-456-7890")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        Text("")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        Text("")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        Text("")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                     
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .padding(.top, 20)
                }
            }
            .navigationTitle(Text(""))
        }
    }
    

    var filteredProducts: [Product] {
        if selectedType == "All" {
            return productList
        } else {
            return productList.filter { $0.type == selectedType }
        }
    }
}

struct AllProducts_Previews: PreviewProvider {
    static var previews: some View {
        AllProducts()
            .environmentObject(CartManager())
    }
}
