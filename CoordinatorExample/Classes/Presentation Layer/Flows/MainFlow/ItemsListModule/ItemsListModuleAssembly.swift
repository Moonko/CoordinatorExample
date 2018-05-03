import Swinject

struct ItemsListModuleAssembly: Assembly {

    func assemble(container: Container) {
        container.register(ItemsListModule.self) { resolver in
            let controller = ItemsListViewController()
            let viewModel = ItemsListViewModelImpl()
            viewModel.itemsService = resolver.resolve(ItemsService.self)
            viewModel.authService = resolver.resolve(AuthService.self)
            controller.viewModel = viewModel
            return controller
        }
    }
}
