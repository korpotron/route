import Foundation

public struct DeeplinkRedirect: RouteLink {
    public let result: RouteResult
}

public extension RouteLink where Self == DeeplinkRedirect {
    static func deeplink(_ result: RouteResult) -> Self {
        DeeplinkRedirect(result: result)
    }
}
