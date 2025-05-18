import SwiftUI

struct ProductsDetails: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product

    var body: some View {
        ScrollView {
            ZStack {
                Color.white
                VStack(alignment: .leading) {
                    ZStack(alignment: .topTrailing) {
                        Image(product.image)
                            .resizable()
                            .ignoresSafeArea(edges: .top)
                            .frame(height: 300)

                        Button(action: {}) {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.red)
                                .padding(.top, 63)
                                .padding(.trailing, 20)
                        }
                    }

                    VStack(alignment: .leading) {
                        HStack {
                            Text(product.name)
                                .font(.title2.bold())
                            Spacer()
                            Text("$\(product.price).00")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical)

                        HStack {
                            HStack(spacing: 10) {
                                ForEach(0..<5) { index in
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.yellow)
                                }
                                Text("(4.5)")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.vertical)

                        Text("Description")
                            .font(.title3)
                            .fontWeight(.medium)
                        Text(product.description)
                            .padding(.vertical)

                        VStack(alignment: .leading) {
                            Text("Colors")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                            HStack {
                                ColorDotView(color: .black)
                                ColorDotView(color: .blue)
                                ColorDotView(color: .green)
                                ColorDotView(color: .red)
                            }
                        }
                        .padding(.vertical)

                        Button(action: {
                            cartManager.addToCart(product: product)
                        }) {
                            Text("Add to Cart")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .background(Color("Main"))
                                .cornerRadius(12)
                        }
                        .padding(.vertical)

                        PayPart(action: {})
                            .frame(width: .infinity, height: 35)
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color("Main"))
                            .cornerRadius(12)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .offset(y: -36)
                    .padding()
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct ProductsDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductsDetails(product: productList[2])
            .environmentObject(CartManager())
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 25, height: 25)
            .clipShape(Circle())
    }
}
