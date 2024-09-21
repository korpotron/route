import Route

struct BagInfoLink: RouteLink {}

extension RouteLink where Self == BagInfoLink {
    static var info: Self {
        BagInfoLink()
    }
}
