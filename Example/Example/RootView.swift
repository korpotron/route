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
        .route(for: BagLink.self) { _ in
            active = .bag
            return .done
        }
        .route(for: ProductsLink.self) { _ in
            active = .products
            return .done
        }
        .route(for: ProductDetailsLink.self) { link in
            active = .products
            return .done
        }
        .route(for: BagInfoLink.self) { _ in
            active = .bag
            return .done
        }
    }
}

#Preview {
    RootView()
}
