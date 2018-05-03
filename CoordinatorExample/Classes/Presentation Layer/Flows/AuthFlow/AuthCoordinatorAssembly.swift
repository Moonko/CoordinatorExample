import Swinject

struct AuthCoordinatorAssembly: Assembly {

    func assemble(container: Container) {
        container.register(AuthCoordinator.self) { (resolver, parentAssembler: Assembler) in
            let assembler = Assembler(
                [
                    AuthModuleAssembly()
                ],
                parent: parentAssembler
            )
            let navigationController = UINavigationController()
            if #available(iOS 11, *) {
                navigationController.navigationBar.prefersLargeTitles = true
            }
            let router = NavigationRouter(rootController: navigationController)
            let coordinator = AuthCoordinatorImpl(assembler: assembler, router: router)
            return coordinator
        }
    }
}
