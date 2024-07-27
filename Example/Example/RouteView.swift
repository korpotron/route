import SwiftUI

struct RouteView<Content: View>: View {
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(content: content)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.yellow)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(8)
    }
}

#Preview {
    RouteView {
        Button("foo") {}
        Button("bar") {}
        Button("baz") {}
    }
}
