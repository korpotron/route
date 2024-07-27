import SwiftUI
import Reroute

struct BagView: View {
    @Environment(\.route)
    var route

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
                }
            }
            .sheet(isPresented: $show) {
                Text("Bag info")
            }
            .navigationTitle("Bag")
        }
        .route(for: BagInfoLink.self) { _ in
            show = true
            return .done
        }
    }
}

#Preview {
    BagView()
}
