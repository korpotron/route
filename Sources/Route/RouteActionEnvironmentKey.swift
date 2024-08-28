import SwiftUI

extension EnvironmentValues {
    @Entry var store = Store()
}

public extension EnvironmentValues {
    @Entry var route = RouteAction(store: Self.__Key_store.defaultValue)
}
