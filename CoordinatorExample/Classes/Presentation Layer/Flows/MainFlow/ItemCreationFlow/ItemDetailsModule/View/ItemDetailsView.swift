import UIKit

final class ItemDetailsView: UIView {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white

        addSubview(nameLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with itemName: String) {
        nameLabel.text = itemName
        setNeedsLayout()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        nameLabel.frame.size = nameLabel.sizeThatFits(bounds.size)
        nameLabel.center = center
    }
}
