import SwiftUI

struct StoreEnvironmentKey: EnvironmentKey {
    static var defaultValue = Store()
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
