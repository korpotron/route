import SwiftUI

struct RoutableViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        let store = Store()
        let action = RouteAction { link in
            store.link = link
        }

        return content
            .environment(\.store, store)
            .environment(\.route, action)
    }
}

public extension View {
    func routable() -> some View {
        modifier(RoutableViewModifier())
    }
}
