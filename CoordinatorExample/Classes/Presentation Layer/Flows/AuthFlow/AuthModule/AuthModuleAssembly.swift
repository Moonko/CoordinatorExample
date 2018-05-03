import Swinject

struct AuthModuleAssembly: Assembly {

    func assemble(container: Container) {
        container.register(AuthModule.self) { resolver in
            let controller = AuthViewController()
            let viewModel = AuthViewModelImpl()
            viewModel.authService = resolver.resolve(AuthService.self)
            controller.viewModel = viewModel
            return controller
        }
    }
}
