import SwiftUI

public struct RouteActionReader<Content: View>: View {
    public let content: (_ route: RouteAction) -> Content

    @Environment(\.route)
    private var route

    public init(@ViewBuilder content: @escaping (_ route: RouteAction) -> Content) {
        self.content = content
    }

    public var body: some View {
        content(route)
    }
}
