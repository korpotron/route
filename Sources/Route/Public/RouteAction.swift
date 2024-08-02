import SwiftUI

public struct RouteAction {
    let block: (Any) -> Void

    init(for store: Store) {
        block = { link in
            store.send(link)
        }
    }

    public func callAsFunction(_ link: Any) {
        block(link)
    }
}
