import SwiftUI

@MainActor
public struct RouteAction {
    @Environment(\.store)
    private var store

    public func callAsFunction(_ data: any Hashable) {
        store.data = data
    }
}
