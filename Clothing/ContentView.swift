import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    @State var currentTab: Tab = .Login 
    @Namespace var animation

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        ZStack {
            switch currentTab {
            case .Login:
                LoginView()
            case .Home:
                HomePage()
            case .Notifications:
                AllProducts().environmentObject(cartManager)
            case .Cart:
                CartView().environmentObject(cartManager)
            case .Profile:
                ProfileView()
            }

            VStack {
                Spacer()
                HStack(spacing: 0) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        TabButton(tab: tab)
                    }
                }
                .padding(.vertical, 10)
                .background(Color.gray)
                .clipShape(Capsule())
                .padding(.horizontal, 20)
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }

    func TabButton(tab: Tab) -> some View {
        Button(action: {
            withAnimation(.spring()) {
                currentTab = tab
            }
        }) {
            VStack(spacing: 4) {
                Image(systemName: currentTab == tab ? "\(tab.rawValue).fill" : tab.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22)
                    .foregroundColor(.white)

                if currentTab == tab {
                    Text(tab.Tabname)
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

enum Tab: String, CaseIterable {
    case Login = "key"
    case Home = "house"
    case Notifications = "square.grid.2x2"
    case Cart = "cart"
    case Profile = "person"

    var Tabname: String {
        switch self {
        case .Login:
            return "Login"
        case .Home:
            return "Home"
        case .Notifications:
            return "Products"
        case .Cart:
            return "Cart"
        case .Profile:
            return "Profile"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CartManager())
    }
}
