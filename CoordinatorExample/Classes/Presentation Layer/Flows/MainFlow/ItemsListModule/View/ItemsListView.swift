import UIKit

final class ItemsListView: UIView {

    let itemsTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        tableView.tableFooterView = UIView()
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(itemsTableView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        itemsTableView.frame = bounds
    }
}
