import SwiftUI

extension EnvironmentValues {
    private struct StoreKey: EnvironmentKey {
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

    private struct RouteKey: EnvironmentKey {
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
