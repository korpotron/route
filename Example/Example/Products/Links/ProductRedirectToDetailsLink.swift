import Route

struct ProductRedirectToDetailsLink: Hashable, RouteLink {
    let product: Product.ID
}
