import SwiftUI

struct RouteViewModifier<T: RouteLink>: ViewModifier {
    let block: (T) -> RouteAction.Result

    @Environment(\.store)
    private var store

    func body(content: Content) -> some View {
        let publisher = store.link(of: T.self)

        return content
            .onReceive(publisher) { value in
                let next = block(value).perform()
                store.send(next)
            }
    }
}

public extension View {
    func route<T: RouteLink>(_: T.Type, block: @escaping (T) -> RouteAction.Result) -> some View {
        modifier(RouteViewModifier(block: block))
    }
}

public extension View {
    @inlinable func route<T: RouteLink>(_ data: T.Type, block: @escaping (T) -> Void) -> some View {
        route(data) { value in
            block(value)
            return .handled
        }
    }

    @inlinable func route(_ data: (some RouteLink).Type, block: @escaping () -> RouteAction.Result) -> some View {
        route(data) { _ in
            block()
        }
    }

    @inlinable func route(_ data: (some RouteLink).Type, block: @escaping () -> Void) -> some View {
        route(data) { _ in
            block()
            return .handled
        }
    }

    @inlinable func route(_ a: (some RouteLink).Type, _ b: (some RouteLink).Type, block: @escaping () -> Void) -> some View {
        route(a, block: block)
            .route(b, block: block)
    }

    @inlinable func route(_ a: (some RouteLink).Type, _ b: (some RouteLink).Type, _ c: (some RouteLink).Type, block: @escaping () -> Void) -> some View {
        route(a, block: block)
            .route(b, block: block)
            .route(c, block: block)
    }
}
