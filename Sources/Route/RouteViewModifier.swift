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
