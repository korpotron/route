import SwiftUI

struct RouteActionEnvironmentKey: EnvironmentKey {
    static let defaultValue = RouteAction(for: StoreEnvironmentKey.defaultValue)
}

public extension EnvironmentValues {
    var route: RouteAction {
        get {
            self[RouteActionEnvironmentKey.self]
        }
        set {
            self[RouteActionEnvironmentKey.self] = newValue
        }
    }
}
