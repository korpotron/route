import SwiftUI
import Route

struct ProductsView: View {
    @State var path = NavigationPath()
    @ObservedObject var repository = ProductRepository()

    var body: some View {
        NavigationStack(path: $path) {
            ProductsListView()
                .navigationDestination(for: ProductDetailsLink.self) { link in
                    ProductDetailsView(product: link.product)
                }
        }
        .route(for: BagInfoLink.self) {
            path.removeLast(path.count)
        }
        .route(for: BagLink.self) {
            path.removeLast(path.count)
        }
        .route(for: ProductsLink.self) {
            path.removeLast(path.count)
        }
        .route(for: ProductDetailsLink.self) { link in
            let product = repository.products.first(where: { $0.id == link.product.id }) ?? link.product
            path.append(ProductDetailsLink(product: product))

            return .done
        }
        .environmentObject(repository)
    }
}

#Preview {
    ProductsView()
}
