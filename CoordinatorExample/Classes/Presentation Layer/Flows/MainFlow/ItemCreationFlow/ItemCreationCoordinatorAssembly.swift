import Swinject

struct ItemCreationCoordinatorAssembly: Assembly {

    func assemble(container: Container) {
        container.register(ItemCreationCoordinator.self) { (_, parentAssembler: Assembler) in
            let assembler = Assembler(
                [
                    ItemCreationModuleAssembly()
                ],
                parent: parentAssembler
            )
            let router = NavigationRouter(rootController: UINavigationController())
            let coordinator = ItemCreationCoordinatorImpl(assembler: assembler, router: router)
            return coordinator
        }
    }
}
