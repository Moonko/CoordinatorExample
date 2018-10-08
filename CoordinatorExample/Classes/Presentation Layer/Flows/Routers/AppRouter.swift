import UIKit

final class AppRouter: Routable {

    // MARK: Presentable

    var toPresent: UIViewController? {
        return rootController
    }

    private var rootController: UIViewController? {
        get {
            return window?.rootViewController
        } set {
            window?.rootViewController = newValue
        }
    }
    private weak var window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
    }

    func setRootModule(_ module: Presentable?, animated: Bool) {
        guard let toController = module?.toPresent else {
            (rootController as? UINavigationController)?.viewControllers = []
            return
        }
        if let fromController = rootController, animated {
            let snapshot = fromController.view.snapshotView(afterScreenUpdates: true)!
            toController.view.addSubview(snapshot)
            rootController = toController
            UIView.animate(withDuration: 0.3, animations: {
                snapshot.alpha = 0.0
                snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
            }, completion: { _ in
                snapshot.removeFromSuperview()
            })
        } else {
            rootController = toController
        }
    }

    func present(_ module: Presentable?, animated: Bool) {
        guard let controllerToPresent = module?.toPresent else { return }
        rootController?.present(controllerToPresent, animated: animated, completion: nil)
    }

    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        rootController?.dismiss(animated: animated, completion: nil)
    }

    func push(_ module: Presentable?, animated: Bool) {
        guard let controllerToPush = module?.toPresent else { return }
        (rootController as? UINavigationController)?.pushViewController(controllerToPush, animated: animated)
    }

    func popModule(animated: Bool) {
        (rootController as? UINavigationController)?.popViewController(animated: animated)
    }
}

