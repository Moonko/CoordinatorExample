protocol Coordinator: class {

    var router: Routable { get }

    func start()
    func start(with deepLink: DeepLinkOption?)
}

extension Coordinator {

    func start() {
        start(with: nil)
    }
}
