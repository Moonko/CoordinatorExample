import UIKit

extension Presentable {

    func embededInNavigation() -> Presentable? {
        guard let controllerToPresent = toPresent else { return nil }
        let navController = UINavigationController(rootViewController: controllerToPresent)
        return navController
    }

    func withRemovedBackItem() -> Presentable? {
        guard let controllerToPresent = toPresent else { return nil }
        controllerToPresent.navigationItem.hidesBackButton = true
        return controllerToPresent
    }

    func withDismissItem() -> Presentable? {
        guard let controllerToPresent = toPresent else { return nil }
        controllerToPresent.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: controllerToPresent,
            action: #selector(UIViewController.dismissModal)
        )
        return controllerToPresent
    }

    func withDisabledLargeTitle() -> Presentable? {
        guard let controllerToPresent = toPresent else { return nil }
        if #available(iOS 11, *) {
            controllerToPresent.navigationItem.largeTitleDisplayMode = .never
        }
        return controllerToPresent
    }

    func withHiddenBottomBar() -> Presentable? {
        toPresent?.hidesBottomBarWhenPushed = true
        return self
    }
}

private extension UIViewController {

    @objc
    func dismissModal() {
        dismiss(animated: true, completion: nil)
    }
}
