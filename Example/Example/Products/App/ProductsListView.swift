import Route
import SwiftUI

struct ProductsListView: View {
    @EnvironmentObject
    var repository: ProductRepository

    @Environment(\.route)
    var route

    @Environment(\.openURL)
    var openURL

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
                Button("url /bag") {
                    openURL(URL(string: "https://example.org/bag")!)
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
