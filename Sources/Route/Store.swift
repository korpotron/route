import Combine

final class Store {
    private var registrar: [ObjectIdentifier: [(RouteLink) -> RouteResult]] = [:]

    func register<T: RouteLink>(_ block: @escaping (T) -> RouteResult) {
        registrar[ObjectIdentifier(T.self), default: []].append(wrap(block))
    }

    func unregister<T: RouteLink>(_ block: @escaping (T) -> RouteResult) {
        let key = ObjectIdentifier(T.self)
        guard var values = registrar[key] else { return }
        let value = wrap(block)

        values.removeAll { $0 as AnyObject === value as AnyObject }

        registrar[key] = values
    }

    func handle<T: RouteLink>(_ link: T) -> RouteOutput {
        let handlers = registrar[ObjectIdentifier(T.self), default: []]

        print("handle \(link)")

        for handler in handlers {
            let result = handler(link)

            switch result.step {
            case let .next(link):
                print("  -> next \(link)")
            case let .done(output):
                print("  -> done \(output)")
            }
        }

        print("  -> done total")
        return .discarded
    }

//    func handle<T: RouteLink>(_ link: T) -> RouteOutput {
//        let handlers = registrar[ObjectIdentifier(T.self), default: []]
//
//        print("handle \(link)")
//
//        for handler in handlers {
//            let result = handler(link)
//
//            switch result.step {
//            case let .next(link):
//                print("  -> next \(link)")
//                return handle(link)
//            case let .done(output):
//                print("  -> done \(output)")
//                return output
//            }
//        }
//
//        print("  -> done total")
//        return .discarded
//    }

    private func wrap<T: RouteLink>(_ block: @escaping (T) -> RouteResult) -> (RouteLink) -> RouteResult {
        {
            block($0 as! T)
        }
    }
}
