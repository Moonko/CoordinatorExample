import UIKit

final class AuthView: UIView {

    let authButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white

        addSubview(authButton)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        authButton.sizeToFit()
        authButton.center = center
    }
}
