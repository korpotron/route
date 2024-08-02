import Route
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
                    Button("product/1") {
                        route(ProductDetailsLink(product: 1))
                    }
                    Button("product/2") {
                        route(ProductDetailsLink(product: 2))
                    }
                    Button("product/3") {
                        route(ProductDetailsLink(product: 3))
                    }
                    Button("product/3 (redirect)") {
                        route(ProductRedirectToDetailsLink(product: 3))
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
        .route(BagInfoLink.self) {
            show = true
        }
    }
}

#Preview {
    BagView()
}
