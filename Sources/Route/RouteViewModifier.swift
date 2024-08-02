import SwiftUI

struct RouteViewModifier<T: RouteLink>: ViewModifier {
    let block: (T) -> RouteResult

    @Environment(\.store)
    private var store

    func body(content: Content) -> some View {
        content
            .onReceive(store.link(of: T.self)) { value in
                let result = block(value)
                store.send(result.next)
            }
    }
}
