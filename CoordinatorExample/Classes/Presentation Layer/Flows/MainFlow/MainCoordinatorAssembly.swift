import Swinject

struct MainCoordinatorAssembly: Assembly {

    func assemble(container: Container) {
        container.register(MainCoordinator.self) { (resolver, parentAssembler: Assembler) in
            let assembler = Assembler(
                [
                    ItemsListModuleAssembly(),
                    ItemDetailsModuleAssembly(),
                    ItemCreationCoordinatorAssembly()
                ],
                parent: parentAssembler
            )
            let navigationController = UINavigationController()
            if #available(iOS 11, *) {
                navigationController.navigationBar.prefersLargeTitles = true
            }
            let router = NavigationRouter(rootController: navigationController)
            let coordinator = MainCoordinatorImpl(assembler: assembler, router: router)
            return coordinator
        }
    }
}
