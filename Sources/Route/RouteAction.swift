import SwiftUI

public struct RouteAction {
    let store: Store

    public func callAsFunction(_ link: any RouteLink) {
        store.handle(link)
    }
}
