import Route

struct ProductRedirectToDetailsLink: Hashable, RouteLink {
    let product: Product.ID
}

extension RouteLink where Self == ProductRedirectToDetailsLink {
    static func product(_ id: Product.ID) -> Self {
        ProductRedirectToDetailsLink(product: id)
    }
}
