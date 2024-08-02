import Foundation

public struct RouteResult {
    let perform: () -> Any?
}

public extension RouteResult {
    static let handled = Self {}

    static func redirected(to link: Any) -> Self {
        Self {
            link
        }
    }
}
