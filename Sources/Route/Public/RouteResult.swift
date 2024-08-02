import Foundation

public enum RouteResult {
    case next(Any)
    case done

    func perform() -> Any? {
        switch self {
        case let .next(link): link
        case .done: nil
        }
    }
}
