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
                        route(.products)
                    }
                    Button("product/1") {
                        route(.details(1))
                    }
                    Button("product/2") {
                        route(.details(2))
                    }
                    Button("product/3") {
                        route(.details(3))
                    }
                    Button("product/3 (redirect)") {
                        route(.product(3))
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
