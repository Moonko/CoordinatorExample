import Swinject

struct AppCoordinatorAssembly: Assembly {

    func assemble(container: Container) {
        container.register(AppCoordinator.self) { (resolver, parentAssembler: Assembler, window: UIWindow?) in
            let assembler = Assembler(
                [
                    AuthCoordinatorAssembly(),
                    MainCoordinatorAssembly()
                ],
                parent: parentAssembler
            )
            let router = AppRouter(window: window)
            let coordinator = AppCoordinatorImpl(assembler: assembler, router: router)
            coordinator.authStateProvider = resolver.resolve(AuthStateProvider.self)
            return coordinator
        }
    }
}

