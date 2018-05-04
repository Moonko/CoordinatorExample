import Swinject

struct ItemDetailsModuleAssembly: Assembly {

    func assemble(container: Container) {
        container.register(ItemDetailsModule.self) { (_, input: ItemDetailsModule.Input) in
            let controller = ItemDetailsViewController()
            let viewModel = ItemDetailsViewModelImpl(item: input)
            controller.viewModel = viewModel
            return controller
        }
    }
}
