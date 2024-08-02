import Foundation

struct Product: Identifiable, Hashable {
    struct ID: Hashable, ExpressibleByIntegerLiteral {
        let value: Int

        init(value: Int) {
            self.value = value
        }

        init(integerLiteral value: IntegerLiteralType) {
            self.init(value: value)
        }
    }

    let id: ID
    let name: String
}
