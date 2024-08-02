import SwiftUI

public extension View {
    func route<T: RouteLink>(_: T.Type, block: @escaping (T) -> RouteResult) -> some View {
        modifier(RouteViewModifier(block: block))
    }
}

public extension View {
    @inlinable func route<T: RouteLink>(_ data: T.Type, block: @escaping (T) -> Void) -> some View {
        route(data) { value in
            block(value)
            return .done
        }
    }
}

public extension View {
    @inlinable func route(_ a: (some RouteLink).Type, block: @escaping () -> Void) -> some View {
        route(a) { _ in
            block()
            return .done
        }
    }

    @inlinable func route(_ a: (some RouteLink).Type, _ b: (some RouteLink).Type, block: @escaping () -> Void) -> some View {
        self
            .route(a, block: block)
            .route(b, block: block)
    }

    @inlinable func route(_ a: (some RouteLink).Type, _ b: (some RouteLink).Type, _ c: (some RouteLink).Type, block: @escaping () -> Void) -> some View {
        self
            .route(a, block: block)
            .route(b, block: block)
            .route(c, block: block)
    }
}

public extension View {
    @inlinable func route(_ a: (some RouteLink).Type, block: @escaping () -> RouteResult) -> some View {
        route(a) { _ in
            block()
        }
    }

    @inlinable func route(_ a: (some RouteLink).Type, _ b: (some RouteLink).Type, block: @escaping () -> RouteResult) -> some View {
        self
            .route(a, block: block)
            .route(b, block: block)
    }

    @inlinable func route(_ a: (some RouteLink).Type, _ b: (some RouteLink).Type, _ c: (some RouteLink).Type, block: @escaping () -> RouteResult) -> some View {
        self
            .route(a, block: block)
            .route(b, block: block)
            .route(c, block: block)
    }
}
