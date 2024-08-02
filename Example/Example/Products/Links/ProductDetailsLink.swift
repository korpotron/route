import Route

struct ProductDetailsLink: Hashable, RouteLink {
    let product: Product.ID
}
