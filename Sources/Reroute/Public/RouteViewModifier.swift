import SwiftUI

struct RouteViewModifier<T: Hashable>: ViewModifier {
    let block: (T) -> RouteResult

    @Environment(\.store)
    private var store

    func body(content: Content) -> some View {
        content
            .onReceive(store.$link.compactMap { $0 as? T }) { value in
                store.link = block(value).perform()
            }
    }
}

public extension View {
    func route<T: Hashable>(for _: T.Type, block: @escaping (T) -> RouteResult) -> some View {
        modifier(RouteViewModifier(block: block))
    }
}
