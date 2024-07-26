import SwiftUI

@MainActor
final class Store: ObservableObject {
    @Published var data: (any Hashable)?
}
