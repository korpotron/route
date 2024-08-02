import SwiftUI

struct StoreEnvironmentKey: EnvironmentKey {
    static let defaultValue = Store()
}

extension EnvironmentValues {
    var store: Store {
        get {
            self[StoreEnvironmentKey.self]
        }
        set {
            self[StoreEnvironmentKey.self] = newValue
        }
    }
}
