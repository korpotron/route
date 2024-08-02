import Route
import SwiftUI

@main
struct ExampleApp: App {
    @Environment(\.route)
    var route

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.openURL, OpenURLAction(handler: deeplink(url:)))
        }
    }

    @MainActor
    func deeplink(url: URL) -> OpenURLAction.Result {
        if let components = URLComponents(string: url.absoluteString), components.host == "example.org" {
            deeplink(path: components.path)
        } else {
            .systemAction
        }
    }

    @MainActor
    func deeplink(path: String) -> OpenURLAction.Result {
        switch path {
        case "/products":
            route(ProductsLink())
            return .handled
        case "/bag":
            route(BagLink())
            return .handled
        default:
            return .discarded
        }
    }
}
