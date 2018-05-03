import Swinject

open class BaseCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []

    let router: Routable
    let assembler: Assembler

    init(assembler: Assembler, router: Routable) {
        self.assembler = assembler
        self.router = router
    }

    open func start(with option: DeepLinkOption?) { }

    func addDependency(_ coordinator: Coordinator) {
        guard !childCoordinators.contains(where: { $0 === coordinator })
            else { return }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: Coordinator?) {
        guard let indexToRemove = childCoordinators.index(where: { $0 === coordinator })
            else { return }
        childCoordinators.remove(at: indexToRemove)
    }

    func removeAllDependencies() {
        childCoordinators.removeAll()
    }
}

