protocol ItemCreationViewModel {

    typealias ItemCreatedBlock = () -> Void

    var onItemCreated: ItemCreatedBlock? { get set }

    func createItem(named name: String)
}

final class ItemCreationViewModelImpl: ItemCreationViewModel {

    var itemsService: ItemsService!

    var onItemCreated: ItemCreatedBlock?

    func createItem(named name: String) {
        let newItem = Item(name: name)
        itemsService.saveItem(newItem)
        onItemCreated?()
    }
}
