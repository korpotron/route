import SwiftUI

private struct RouteActionEnvironmentKey: EnvironmentKey {
    @MainActor
    static let defaultValue = RouteAction()
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
