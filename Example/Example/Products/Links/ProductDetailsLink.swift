import Route

struct ProductDetailsLink: Hashable, RouteLink {
    let product: Product.ID
}

extension RouteLink where Self == ProductDetailsLink {
    static func details(_ id: Product.ID) -> Self {
        ProductDetailsLink(product: id)
    }
}
