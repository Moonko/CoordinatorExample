protocol Routable: Presentable {

    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)

    func push(_ module: Presentable?)
    func push(_ module: Presentable?, animated: Bool)

    func popModule()
    func popModule(animated: Bool)

    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> Void)?)

    func setRootModule(_ module: Presentable?)
    func setRootModule(_ module: Presentable?, animated: Bool)
}

extension Routable {

    func present(_ module: Presentable?) {
        present(module, animated: true)
    }

    func push(_ module: Presentable?) {
        push(module, animated: true)
    }

    func popModule() {
        popModule(animated: true)
    }

    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }

    func setRootModule(_ module: Presentable?) {
        setRootModule(module, animated: true)
    }
}
