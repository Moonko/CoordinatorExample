import UIKit

struct NavigationRouter: Routable {

    private let rootController: UINavigationController

    init(rootController: UINavigationController) {
        self.rootController = rootController
    }

    // MARK: Routable

    var toPresent: UIViewController? {
        return rootController
    }

    func present(_ module: Presentable?, animated: Bool) {
        guard let controllerToPresent = module?.toPresent else { return }
        rootController.present(controllerToPresent, animated: animated, completion: nil)
    }

    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        rootController.dismiss(animated: animated, completion: completion)
    }

    func push(_ module: Presentable?, animated: Bool) {
        guard let controllerToPush = module?.toPresent else { return }
        // Won't show the same screen twice
        if let topController = rootController.topViewController,
            type(of: controllerToPush) == type(of: topController) { return }
        rootController.pushViewController(controllerToPush, animated: animated)
    }

    func popModule(animated: Bool) {
        rootController.popViewController(animated: animated)
    }

    func setRootModule(_ module: Presentable?, animated: Bool) {
        guard let controllerToSet = module?.toPresent else { return }
        rootController.setViewControllers([controllerToSet], animated: animated)
    }
}

