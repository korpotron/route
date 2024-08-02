import SwiftUI

struct ProductNotFoundView: View {
    var body: some View {
        VStack {
            Text(verbatim: "Product not found")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .navigationTitle("Product details")
    }
}

#Preview {
    ProductNotFoundView()
}
