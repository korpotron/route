import SwiftUI
import Route

struct ProductsView: View {
    @State var path = NavigationPath()
    @ObservedObject var repository = ProductRepository()

    var body: some View {
        NavigationStack(path: $path) {
            ProductsListView()
                .navigationDestination(for: ProductDetailsLink.self) { link in
                    view(for: link.product)
                }
        }
        .route(BagInfoLink.self, BagLink.self, ProductsLink.self) {
            path.removeLast(path.count)
        }
        .route(ProductDetailsLink.self) { link in
            path.append(ProductDetailsLink(product: link.product))
            return .done
        }
        .environmentObject(repository)
    }

    @ViewBuilder func view(for id: Product.ID) -> some View {
        if let product = repository.find(by: id){
            ProductDetailsView(product: product)
        } else {
            ProductNotFoundView()
        }
    }
}

#Preview {
    ProductsView()
}
