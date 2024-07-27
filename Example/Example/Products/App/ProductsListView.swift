import SwiftUI
import Reroute

struct ProductsListView: View {
    @EnvironmentObject
    var repository: ProductRepository

    @Environment(\.route)
    var route

    var body: some View {
        VStack {
            List {
                ForEach(repository.products) { product in
                    NavigationLink(value: ProductDetailsLink(product: product)) {
                        VStack(alignment: .leading) {
                            Text(verbatim: product.name)
                            Text(verbatim: String(product.id))
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            RouteView {
                Button("bag") {
                    route(BagLink())
                }
                Button("bag info") {
                    route(BagInfoLink())
                }
            }
        }
        .navigationTitle("Products")
    }
}

#Preview {
    ProductsListView()
        .environmentObject(ProductRepository())
}
