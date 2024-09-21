import Route

struct ProductsLink: RouteLink {}

extension RouteLink where Self == ProductsLink {
    static var products: Self {
        ProductsLink()
    }
}
