import Swinject

struct ServicesAssembly: Assembly {

    func assemble(container: Container) {
        registerAuthServices(in: container)
        registerItemsServices(in: container)
    }

    private func registerAuthServices(in container: Container) {
        let authService = AuthServiceImpl()
        authService.storage = AuthStorageImpl()

        container.register(AuthService.self) { _ in
            return authService
        }.inObjectScope(.container)

        container.register(AuthStateProvider.self) { _ in
            return authService
        }.inObjectScope(.container)
    }

    private func registerItemsServices(in container: Container) {
        container.register(ItemsService.self) { _ in
            return ItemsServiceImpl()
        }.inObjectScope(.container)
    }
}
