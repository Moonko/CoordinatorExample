
import UIKit

final class ItemsListViewController: UIViewController,
            ItemsListModule,
            ViewHolder,
            UITableViewDelegate,
            UITableViewDataSource {

    var onViewDidAppear: ViewDidAppearBlock?
    var onItemCreate: ItemCreationBlock?
    var onItemSelect: ItemSelectBlock?
    var onLogout: LogoutBlock?

    var viewModel: ItemsListViewModel!

    // MARK: View lifecycle

    typealias RootViewType = ItemsListView

    override func loadView() {
        view = ItemsListView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Items"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(handleAddButtonTap)
        )
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Logout",
            style: .plain,
            target: self,
            action: #selector(handleLogoutButtonTap)
        )

        bindTableView()
        bindItemsUpdate()

        viewModel.startUpdatingItems()
        rootView.itemsTableView.reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        onViewDidAppear?()
    }

    // MARK: Bindings

    private func bindTableView() {
        rootView.itemsTableView.dataSource = self
        rootView.itemsTableView.delegate = self

        rootView.itemsTableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: Constants.itemCellKey
        )
    }

    private func bindItemsUpdate() {
        viewModel.onItemsUpdate = { [weak tableView = rootView.itemsTableView] in
            tableView?.reloadData()
        }
    }

    @objc
    private func handleAddButtonTap() {
        onItemCreate?()
    }

    @objc
    private func handleLogoutButtonTap() {
        viewModel.logout()
        onLogout?()
    }

    // MARK: UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.itemCellKey,
            for: indexPath
        )
        let item = viewModel.items[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }

    // MARK: UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        onItemSelect?(viewModel.items[indexPath.row])
    }

    deinit {
        viewModel.stopUpdatingItems()
    }
}

private extension ItemsListViewController {

    struct Constants {

        static let itemCellKey = "item_cell_key"

        private init() { }
    }
}
