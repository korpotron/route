import SwiftUI
import Route

struct ProductsView: View {
    enum Child: Hashable {
        case details(Product.ID)
    }

    @State var path: [Child] = []
    @ObservedObject var repository = ProductRepository()

    var body: some View {
        NavigationStack(path: $path) {
            ProductsListView()
                .navigationDestination(for: Child.self, destination: view(for:))
        }
        .route(BagInfoLink.self, BagLink.self, ProductsLink.self) {
            path = []
        }
        .route(ProductDetailsLink.self) { link in
            path = [.details(link.product)]
            return .done
        }
        .environmentObject(repository)
    }

    @ViewBuilder func view(for child: Child) -> some View {
        switch child {
        case let .details(id):
            view(for: id)
        }
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
