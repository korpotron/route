import SwiftUI

public struct RouteResult {
    let value: [any RouteLink]
}

public extension RouteResult {
    static var done: Self {
        Self(value: [])
    }

    static func next(_ links: RouteLink...) -> Self {
        Self(value: links)
    }
}
