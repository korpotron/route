import SwiftUI

public struct RouteAction {
    let store: Store

    public func callAsFunction(_ link: RouteLink) {
        store.send(link)
    }
}
