import SwiftUI

public struct RouteAction {
    let block: (RouteLink) -> Void

    init(for store: Store) {
        block = { link in
            store.send(link)
        }
    }

    public func callAsFunction(_ link: RouteLink) {
        block(link)
    }

    public struct Result {
        let perform: () -> RouteLink?

        public static let handled = Self {
            nil
        }

        public static func redirected(to link: RouteLink) -> Self {
            Self {
                link
            }
        }
    }
}
