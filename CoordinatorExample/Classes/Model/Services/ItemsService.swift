protocol ItemsListener {

    func itemsWereUpdated()
}

protocol ItemsService {

    var items: [Item] { get }

    func addListener(_ listener: ItemsListener, with id: String)
    func removeListener(with id: String)

    func saveItem(_ item: Item)
}

final class ItemsServiceImpl: ItemsService {

    private(set) var items: [Item] = []

    private var listeners = [String: ItemsListener]()

    func addListener(_ listener: ItemsListener, with id: String) {
        listeners[id] = listener
    }

    func removeListener(with id: String) {
        listeners.removeValue(forKey: id)
    }

    func saveItem(_ item: Item) {
        items.append(item)
        listeners.values.forEach { $0.itemsWereUpdated() }
    }
}
