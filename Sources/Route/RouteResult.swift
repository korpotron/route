import SwiftUI

public struct RouteResult {
    let value: [RouteLink]
}

public extension RouteResult {
    static let done = Self(value: [])

    static func next(_ links: RouteLink...) -> Self {
        Self(value: links)
    }
}
