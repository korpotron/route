import Foundation

public enum RouteResult {
    case next(any Hashable)
    case done

    func perform() -> (any Hashable)? {
        switch self {
        case let .next(hashable):
            hashable
        case .done:
            nil
        }
    }
}
