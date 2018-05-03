import UIKit

final class AuthViewController: UIViewController,
            AuthModule,
            ViewHolder {

    var onFinish: Completion?

    var viewModel: AuthViewModel!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        title = "Auth"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: ViewHolder

    typealias RootViewType = AuthView

    // MARK: Lifecycle

    override func loadView() {
        view = AuthView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        bindAuthButton()
    }

    // MARK: Bindings

    private func bindAuthButton() {
        rootView.authButton.addTarget(self, action: #selector(auth), for: .touchUpInside)
    }

    @objc
    private func auth() {
        viewModel.auth { [weak self] in
            self?.onFinish?()
        }
    }
}
