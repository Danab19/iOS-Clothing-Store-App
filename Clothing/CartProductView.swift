import SwiftUI

struct CartProductView: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product

    var body: some View {
        HStack(spacing: 20) {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
                .cornerRadius(9)

            VStack(alignment: .leading, spacing: 5) {
                Text(product.name)
                    .bold()
                Text("$ \(product.price)")
                    .bold()
                Text("Quantity: \(cartManager.quantities[product.id] ?? 0)")
                    .font(.subheadline)
            }
            .padding()

            Spacer()

            HStack(spacing: 10) {
                Button(action: {
                    cartManager.decrement(product: product)
                }) {
                    Image(systemName: "minus.circle")
                        .foregroundColor(.red)
                        .font(.system(size: 20))
                }

                Button(action: {
                    cartManager.increment(product: product)
                }) {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.green)
                        .font(.system(size: 20))
                }
            }

            Image(systemName: "trash")
                .foregroundColor(.red)
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
        }
        .padding(.horizontal)
        .background(Color("kSecondary"))
        .cornerRadius(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct CartProductView_Previews: PreviewProvider {
    static var previews: some View {
        CartProductView(product: productList[2])
            .environmentObject(CartManager())
    }
}
