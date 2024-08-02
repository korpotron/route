import SwiftUI

public struct RouteResult {
    enum Step {
        case done(RouteOutput)
        case next(RouteLink)
    }

    let step: Step

    public static let handled = Self(step: .done(.handled))
    public static let discarded = Self(step: .done(.discarded))

    public static func redirected(to link: RouteLink) -> Self {
        Self(step: .next(link))
    }
}

public enum RouteOutput {
    case handled
    case discarded
}

extension OpenURLAction.Result {
    init(from output: RouteOutput) {
        self = switch output {
        case .handled: .handled
        case .discarded: .discarded
        }
    }
}
