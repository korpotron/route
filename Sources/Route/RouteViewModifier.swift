import Combine
import SwiftUI

struct RouteViewModifier<T: RouteLink>: ViewModifier {
    let block: (T) -> RouteResult

    @Environment(\.store)
    private var store

    private var publisher: AnyPublisher<T, Never> {
        store.link(of: T.self)
    }

    func body(content: Content) -> some View {
        content
            .onReceive(publisher, perform: handle)
    }

    func handle(value: T) {
        let result = block(value)

        for next in result.value {
            store.send(next)
        }

        store.send(nil)
    }
}
