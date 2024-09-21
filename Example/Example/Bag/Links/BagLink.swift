import Route

struct BagLink: RouteLink {}

extension RouteLink where Self == BagLink {
    static var bag: Self {
        BagLink()
    }
}
