import UIKit

final class ItemCreationViewController: UIViewController,
            ItemCreationModule,
            ViewHolder {

    var onFinish: Completion?

    var viewModel: ItemCreationViewModel!

    // MARK: View lifecycle

    typealias RootViewType = ItemCreationView

    override func loadView() {
        view = ItemCreationView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        bindItemCreation()

        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancelButtonTap))

        rootView.createButton.addTarget(self, action: #selector(handleCreateButtonTap), for: .touchUpInside)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        rootView.nameTextField.becomeFirstResponder()
    }

    // MARK: Bindings

    private func bindItemCreation() {
        viewModel.onItemCreated = { [weak self] in
            self?.onFinish?()
        }
    }

    @objc
    private func handleCancelButtonTap() {
        onFinish?()
    }

    @objc
    private func handleCreateButtonTap() {
        let itemName = rootView.nameTextField.text ?? ""
        viewModel.createItem(named: itemName)
    }
}
