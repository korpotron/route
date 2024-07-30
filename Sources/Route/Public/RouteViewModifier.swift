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

public extension View {
    @inlinable func route<T: Hashable>(for data: T.Type, block: @escaping (T) -> Void) -> some View {
        route(for: data) { value in
            block(value)
            return .done
        }
    }

    @inlinable func route(for data: (some Hashable).Type, block: @escaping () -> RouteResult) -> some View {
        route(for: data) { _ in
            block()
        }
    }

    @inlinable func route(for data: (some Hashable).Type, block: @escaping () -> Void) -> some View {
        route(for: data) { _ in
            block()
            return .done
        }
    }
}
