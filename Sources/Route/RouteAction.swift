import SwiftUI

public struct RouteAction {
    private let handler: (RouteLink) -> Void

    public init(handler: @escaping (RouteLink) -> Void) {
        self.handler = handler
    }

    public func callAsFunction(_ link: RouteLink) {
        handler(link)
    }
}

extension RouteAction {
    init(store: Store) {
        self.init { link in
            store.send(link)
        }
    }
}
