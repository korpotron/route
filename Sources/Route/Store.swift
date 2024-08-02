import Combine

struct Store {
    private let subject: CurrentValueSubject<RouteLink?, Never> = .init(nil)

    func send(_ link: RouteLink?) {
        subject.send(link)
    }

    func link<T: RouteLink>(of _: T.Type) -> AnyPublisher<T, Never> {
        subject
            .compactMap { $0 as? T }
            .eraseToAnyPublisher()
    }
}
