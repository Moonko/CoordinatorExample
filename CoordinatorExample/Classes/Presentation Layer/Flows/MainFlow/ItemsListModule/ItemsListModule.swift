protocol ItemsListModule: Presentable {

    typealias ViewDidAppearBlock = () -> Void
    typealias ItemCreationBlock = () -> Void
    typealias ItemSelectBlock = (Item) -> Void
    typealias LogoutBlock = () -> Void

    var onViewDidAppear: ViewDidAppearBlock? { get set }
    var onItemCreate: ItemCreationBlock? { get set }
    var onItemSelect: ItemSelectBlock? { get set }
    var onLogout: LogoutBlock? { get set }
}
