import SwiftUI

extension EnvironmentValues {
    private struct StoreKey: @preconcurrency EnvironmentKey {
        @MainActor
        static let defaultValue = Store()
    }

    var store: Store {
        get {
            self[StoreKey.self]
        }
        set {
            self[StoreKey.self] = newValue
        }
    }

    private struct RouteKey: @preconcurrency EnvironmentKey {
        @MainActor
        static let defaultValue = RouteAction(store: StoreKey.defaultValue)
    }

    public var route: RouteAction {
        get {
            self[RouteKey.self]
        }
        set {
            self[RouteKey.self] = newValue
        }
    }
}
