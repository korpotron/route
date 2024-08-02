import SwiftUI

@MainActor
public struct RouteAction {
    let block: (Any) -> Void

    public func callAsFunction(_ link: Any) {
        block(link)
    }
}
