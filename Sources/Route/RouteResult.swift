import SwiftUI

public struct RouteResult {
    let next: RouteLink?

    public static let done = Self(next: nil)

    public static func next(_ link: RouteLink) -> Self {
        Self(next: link)
    }
}
