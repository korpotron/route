import Combine

@MainActor
struct Store {
    private let subject: CurrentValueSubject<Any?, Never> = .init(nil)

    func send(_ link: Any?) {
        subject.send(link)
    }

    func link<T>(of _: T.Type) -> AnyPublisher<T, Never> {
        subject.compactMap { $0 as? T }.eraseToAnyPublisher()
    }
}
