import SwiftUI

struct HomePage: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var search: String = "" 

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Abar()
                    SearchView(search: $search) 
                    ImageSliderView()
                    
                    HStack {
                        Text("New Products")
                            .font(.title2)
                            .fontWeight(.medium)
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            AllProducts()
                        }, label: {
                            Image(systemName: "circle.grid.2x2.fill")
                                .foregroundColor(Color("Main"))
                        })
                    }
                    .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(productList.filter { product in
                                search.isEmpty ||
                                product.name.localizedCaseInsensitiveContains(search) ||
                                product.type.localizedCaseInsensitiveContains(search)
                            }, id: \.id) { product in
                                NavigationLink {
                                    ProductsDetails(product: product)
                                } label: {
                                    ProductCard(product: product)
                                       
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
            .environmentObject(CartManager())
    }
}


struct Abar: View {
    
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading){
                HStack {
                    Image(systemName: "location.north.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing)
                    Text("Manama, Bahrain")
                        .font(.title2)
                        .foregroundColor(.gray)
                    Spacer()
                   
             
            }
                Text("Find Your \nStyle ")
                        .font(.largeTitle .bold())
                    + Text("Clothing Items")
                        .font(.largeTitle .bold())
                        .foregroundColor(Color("kPrimary"))
                    
            }
        }
        .padding()
        .environmentObject(CartManager())

    }
}
