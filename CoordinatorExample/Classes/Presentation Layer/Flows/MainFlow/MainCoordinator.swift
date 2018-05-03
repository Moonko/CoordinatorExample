protocol MainCoordinator: Coordinator {

    typealias LogoutBlock = () -> Void

    var onLogout: LogoutBlock? { get set }
}

final class MainCoordinatorImpl: BaseCoordinator, MainCoordinator {

    var onLogout: LogoutBlock?

    private var deepLink: DeepLinkOption?

    override func start(with option: DeepLinkOption?) {
        showItemsList()

        deepLink = option
    }

    private func showItemsList() {
        var module = assembler.resolver.resolve(ItemsListModule.self)
        module?.onViewDidAppear = { [weak self] in
            guard let deepLink = self?.deepLink as? CEDeepLinkOption else { return }
            switch deepLink {
            case .itemCreation:
                self?.runItemCreationFlow(animated: true)
            }
            self?.deepLink = nil
        }
        module?.onItemCreate = { [weak self] in
            self?.runItemCreationFlow(animated: true)
        }
        module?.onItemSelect = showDetails
        module?.onLogout = onLogout
        router.push(module, animated: false)
    }

    private func showDetails(for item: Item) {
        let input: ItemDetailsModule.Input = item
        let module = assembler.resolver.resolve(ItemDetailsModule.self, argument: input)
        router.push(module)
    }

    private func runItemCreationFlow(animated: Bool) {
        let coordinator = assembler.resolver.resolve(ItemCreationCoordinator.self, argument: assembler)!
        coordinator.onFinish = { [weak coordinator, weak self] in
            self?.removeDependency(coordinator)
            self?.router.dismissModule()
        }
        addDependency(coordinator)
        router.present(coordinator.router, animated: animated)
        coordinator.start()
    }
}
