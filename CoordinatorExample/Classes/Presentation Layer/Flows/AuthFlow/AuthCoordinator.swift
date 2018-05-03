protocol AuthCoordinator: Coordinator {

    typealias Completion = (DeepLinkOption?) -> Void

    var onFinish: Completion? { get set }
}

final class AuthCoordinatorImpl: BaseCoordinator, AuthCoordinator {

    var onFinish: Completion?

    private var deepLink: DeepLinkOption?

    override func start(with deepLink: DeepLinkOption?) {
        self.deepLink = deepLink

        showAuthModule()
    }

    func showAuthModule() {
        var module = assembler.resolver.resolve(AuthModule.self)
        module?.onFinish = { [weak self] in
            self?.onFinish?(self?.deepLink)
        }
        router.push(module)
    }
}
