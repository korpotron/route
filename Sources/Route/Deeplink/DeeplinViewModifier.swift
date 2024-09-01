import SwiftUI

public struct DeeplinViewModifier: ViewModifier {
    private let mapping: (_ url: URL) -> RouteLink

    public init(mapping: @escaping (_ url: URL) -> RouteLink) {
        self.mapping = mapping
    }

    public func body(content: Content) -> some View {
        RouteActionReader { route in
            content.onOpenURL { url in
                route(mapping(url))
            }
        }
    }
}

extension View {
    @inlinable
    func deeplink(_ mapping: @escaping (_ url: URL) -> RouteLink) -> some View {
        modifier(DeeplinViewModifier(mapping: mapping))
    }
}
