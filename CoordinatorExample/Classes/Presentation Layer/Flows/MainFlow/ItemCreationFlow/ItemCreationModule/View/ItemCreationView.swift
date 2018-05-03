import UIKit

final class ItemCreationView: UIView {

    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter item name"
        return textField
    }()

    let createButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create item", for: .normal)
        return button
    }()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white

        addSubview(scrollView)
        scrollView.addSubview(nameTextField)
        scrollView.addSubview(createButton)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let offset: CGFloat = 15

        scrollView.frame = bounds

        nameTextField.frame = CGRect(
            x: offset,
            y: offset,
            width: bounds.width - offset * 2,
            height: 44
        )

        createButton.frame = CGRect(
            x: offset,
            y: nameTextField.frame.maxY + offset,
            width: bounds.width - offset * 2,
            height: 44
        )

        scrollView.contentSize = CGSize(width: bounds.width, height: createButton.frame.maxY)
    }
}
