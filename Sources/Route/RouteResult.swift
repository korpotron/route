import SwiftUI

public struct RouteResult {
    let value: [RouteLink]

    public static let done = Self(value: [])

    public static func next(_ links: RouteLink...) -> Self {
        Self(value: links)
    }
}
