import SwiftUI

@MainActor
public struct RouteAction {
    let block: (Any) -> Void

    init(for store: Store) {
        block = { link in
            store.link = link
        }
    }

    public func callAsFunction(_ link: Any) {
        block(link)
    }
}
