import SwiftUI

struct ProductDetailsView: View {
    let product: Product

    @Environment(\.route)
    var route

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(verbatim: product.name)
                    Text(verbatim: String(product.id.value))
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            RouteView {
                Button("bag") {
                    route(BagLink())
                }
                Button("bag info") {
                    route(BagInfoLink())
                }
                Button("products") {
                    route(ProductsLink())
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .navigationTitle(product.name)
    }
}
