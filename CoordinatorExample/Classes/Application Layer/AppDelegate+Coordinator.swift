import Swinject

extension AppDelegate {

    func makeAppCoordinator() -> Coordinator {
        let rootAssembler = Assembler(
            [
                ServicesAssembly(),
                AppCoordinatorAssembly()
            ],
            container: Container()
        )
        return rootAssembler.resolver.resolve(
            AppCoordinator.self,
            arguments: rootAssembler, window)!
    }
}
