import SwiftUI

@MainActor
public struct RouteAction {
    let block: (any Hashable) -> Void

    public func callAsFunction(_ link: any Hashable) {
        block(link)
    }
}
