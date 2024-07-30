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
        .route(for: BagLink.self) {
            active = .bag
        }
        .route(for: ProductsLink.self) {
            active = .products
        }
        .route(for: ProductDetailsLink.self) { _ in
            active = .products
        }
        .route(for: BagInfoLink.self) {
            active = .bag
        }
    }
}

#Preview {
    RootView()
}
