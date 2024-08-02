import SwiftUI

struct RouteViewModifier<T: RouteLink>: ViewModifier {
    let block: (T) -> RouteResult

    @Environment(\.store)
    private var store

    func body(content: Content) -> some View {
        content
            .onAppear {
                store.register(block)
            }
            .onDisappear {
                store.unregister(block)
            }
    }
}
