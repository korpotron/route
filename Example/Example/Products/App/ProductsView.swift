import Route
import SwiftUI

struct ProductsView: View {
    @State var path: [ProductsListChild] = []
    @ObservedObject var repository = ProductRepository()

    var body: some View {
        NavigationStack(path: $path) {
            ProductsListView()
                .navigationDestination(for: ProductsListChild.self, destination: view(for:))
        }
        .route(BagInfoLink.self, BagLink.self, ProductsLink.self) {
            path = []
        }
        .route(ProductDetailsLink.self) { link in
            path = [.details(link.product)]
        }
        .route(ProductRedirectToDetailsLink.self) { link in
            .next(ProductDetailsLink(product: link.product))
        }
        .environmentObject(repository)
    }

    @ViewBuilder func view(for child: ProductsListChild) -> some View {
        switch child {
        case let .details(id):
            view(for: id)
        }
    }

    @ViewBuilder func view(for id: Product.ID) -> some View {
        if let product = repository.find(by: id) {
            ProductDetailsView(product: product)
        } else {
            ProductNotFoundView()
        }
    }
}

#Preview {
    ProductsView()
}
