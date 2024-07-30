import SwiftUI

struct RootView: View {
    enum Child: Hashable {
        case products
        case bag
    }

    @State var active: Child = .products

    var body: some View {
        TabView(selection: $active) {
            ProductsView()
                .tabItem {
                    Label("Products", systemImage: "laptopcomputer.and.iphone")
                }
                .tag(Child.products)
            BagView()
                .tabItem {
                    Label("Bag", systemImage: "bag")
                }
                .tag(Child.bag)
        }
        .route(BagLink.self, BagInfoLink.self) {
            active = .bag
        }
        .route(ProductsLink.self, ProductDetailsLink.self) {
            active = .products
        }
    }
}

#Preview {
    RootView()
}
