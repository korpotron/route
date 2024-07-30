import Reroute
import SwiftUI

struct BagView: View {
    @Environment(\.route)
    var route

    @Environment(\.openURL)
    var openURL

    @State var show = false

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                RouteView {
                    Button("products") {
                        route(ProductsLink())
                    }
                    Button("product/2") {
                        route(ProductDetailsLink(product: Product(id: 2, name: "XXX")))
                    }
                    Button("url /products") {
                        openURL(URL(string: "https://example.org/products")!)
                    }
                }
            }
            .sheet(isPresented: $show) {
                Text("Bag info")
            }
            .navigationTitle("Bag")
        }
        .route(for: BagInfoLink.self) {
            show = true
        }
    }
}

#Preview {
    BagView()
}
