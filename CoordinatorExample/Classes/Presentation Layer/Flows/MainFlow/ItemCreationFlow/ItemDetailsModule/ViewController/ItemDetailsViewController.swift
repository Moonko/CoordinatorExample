import UIKit

final class ItemDetailsViewController: UIViewController,
            ItemDetailsModule,
            ViewHolder {

    var viewModel: ItemDetailsViewModel!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        title = "Item details"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle

    typealias RootViewType = ItemDetailsView

    override func loadView() {
        view = ItemDetailsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.configure(with: viewModel.itemName)
    }
}
