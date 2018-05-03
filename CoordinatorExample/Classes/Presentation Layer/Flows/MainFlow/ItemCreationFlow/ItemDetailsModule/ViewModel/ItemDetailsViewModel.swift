protocol ItemDetailsViewModel {

    var itemName: String { get }
}

final class ItemDetailsViewModelImpl: ItemDetailsViewModel {

    let itemName: String

    init(item: Item) {
        self.itemName = item.name
    }
}
