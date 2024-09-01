import Foundation

public struct InvalidDeeplinkRedirect: RouteLink {
    public let url: URL
}

public extension RouteLink where Self == InvalidDeeplinkRedirect {
    static func invalid(url: URL) -> Self {
        InvalidDeeplinkRedirect(url: url)
    }
}
