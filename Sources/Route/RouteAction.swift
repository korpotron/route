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

    public struct Result {
        let perform: () -> Any?

        public static let handled = Self {}

        public static func redirected(to link: Any) -> Self {
            Self {
                link
            }
        }
    }
}
