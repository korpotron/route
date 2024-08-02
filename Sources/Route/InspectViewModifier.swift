import SwiftUI

struct InspectViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
    }
}

public extension View {
    func inspect() -> some View {
        modifier(InspectViewModifier())
    }
}
