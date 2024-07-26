import SwiftUI

private struct StoreEnvironmentKey: EnvironmentKey {
    @MainActor
    static var defaultValue = Store()
}

extension EnvironmentValues {
    @MainActor
    var store: Store {
        get {
            self[StoreEnvironmentKey.self]
        }
        set {
            self[StoreEnvironmentKey.self] = newValue
        }
    }
}
