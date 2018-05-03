import Swinject

struct ItemCreationModuleAssembly: Assembly {

    func assemble(container: Container) {
        container.register(ItemCreationModule.self) { resolver in
            let controller = ItemCreationViewController()
            let viewModel = ItemCreationViewModelImpl()
            viewModel.itemsService = resolver.resolve(ItemsService.self)
            controller.viewModel = viewModel
            return controller
        }
    }
}
