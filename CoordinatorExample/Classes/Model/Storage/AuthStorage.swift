import Foundation

typealias Auth = Bool

protocol AuthStorage {

    func saveAuth(_ newValue: Auth)
    func obtainAuth() -> Auth
}

final class AuthStorageImpl: AuthStorage {

    private var auth: Auth {
        get {
            return UserDefaults.standard.bool(forKey: Constants.authenticatedKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.authenticatedKey)
        }
    }

    func saveAuth(_ newValue: Auth) {
        auth = newValue
    }

    func obtainAuth() -> Auth {
        return auth
    }
}

private extension AuthStorageImpl {

    struct Constants {

        static let authenticatedKey = "authenticated"

        private init() { }
    }
}
