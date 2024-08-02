import SwiftUI

struct RouteActionEnvironmentKey: EnvironmentKey {
    @MainActor
    static let defaultValue = RouteAction(for: StoreEnvironmentKey.defaultValue)
}

public extension EnvironmentValues {
    @MainActor
    var route: RouteAction {
        get {
            self[RouteActionEnvironmentKey.self]
        }
        set {
            self[RouteActionEnvironmentKey.self] = newValue
        }
    }
}
