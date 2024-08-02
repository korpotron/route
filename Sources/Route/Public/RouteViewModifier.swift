import SwiftUI

struct RouteViewModifier<T>: ViewModifier {
    let block: (T) -> RouteResult

    @Environment(\.store)
    private var store

    func body(content: Content) -> some View {
        content
            .onReceive(store.$link.compactMap { $0 as? T }) { value in
                let next = block(value).perform()
                store.link = next
            }
    }
}

public extension View {
    func route<T>(_: T.Type, block: @escaping (T) -> RouteResult) -> some View {
        modifier(RouteViewModifier(block: block))
    }
}

public extension View {
    @inlinable func route<T>(_ data: T.Type, block: @escaping (T) -> Void) -> some View {
        route(data) { value in
            block(value)
            return .handled
        }
    }

    @inlinable func route(_ data: (some Any).Type, block: @escaping () -> RouteResult) -> some View {
        route(data) { _ in
            block()
        }
    }

    @inlinable func route(_ data: (some Any).Type, block: @escaping () -> Void) -> some View {
        route(data) { _ in
            block()
            return .handled
        }
    }

    @inlinable func route(_ a: (some Any).Type, _ b: (some Any).Type, block: @escaping () -> Void) -> some View {
        route(a, block: block)
            .route(b, block: block)
    }

    @inlinable func route(_ a: (some Any).Type, _ b: (some Any).Type, _ c: (some Any).Type, block: @escaping () -> Void) -> some View {
        route(a, block: block)
            .route(b, block: block)
            .route(c, block: block)
    }
}
