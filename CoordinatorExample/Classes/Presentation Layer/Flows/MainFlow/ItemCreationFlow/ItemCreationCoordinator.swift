protocol ItemCreationCoordinator: Coordinator {

    typealias Completion = () -> Void

    var onFinish: Completion? { get set }
}

final class ItemCreationCoordinatorImpl: BaseCoordinator, ItemCreationCoordinator {

    var onFinish: Completion?

    override func start(with option: DeepLinkOption?) {
        showItemCreation()
    }

    private func showItemCreation() {
        var module = assembler.resolver.resolve(ItemCreationModule.self)
        module?.onFinish = { [weak self] in
            self?.onFinish?()
        }
        router.setRootModule(module, animated: false)
    }
}
