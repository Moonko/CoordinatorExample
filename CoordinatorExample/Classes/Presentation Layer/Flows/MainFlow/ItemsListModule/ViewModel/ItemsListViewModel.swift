protocol ItemsListViewModel {

    typealias UpdateBlock = () -> Void

    var items: [Item] { get }
    var onItemsUpdate: UpdateBlock? { get set }

    func startUpdatingItems()
    func stopUpdatingItems()
    func logout()
}

final class ItemsListViewModelImpl: ItemsListViewModel, ItemsListener {

    var onItemsUpdate: UpdateBlock?

    var itemsService: ItemsService!
    var authService: AuthService!

    var items: [Item] {
        return itemsService.items
    }

    func startUpdatingItems() {
        itemsService.addListener(self, with: Constants.listenerKey)
    }

    func stopUpdatingItems() {
        itemsService.removeListener(with: Constants.listenerKey)
    }

    func itemsWereUpdated() {
        onItemsUpdate?()
    }

    func logout() {
        authService.logout()
    }
}

private extension ItemsListViewModelImpl {

    struct Constants {

        static let listenerKey = "items_list_listener"

        private init() { }
    }
}
