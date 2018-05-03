import Foundation

protocol AuthStateProvider {

    var authState: Auth { get }
}

protocol AuthService {

    func auth()
    func logout()
}

final class AuthServiceImpl: AuthService, AuthStateProvider {

    var storage: AuthStorage!

    // MARK: AuthService

    func auth() {
        storage.saveAuth(true)
    }

    func logout() {
        storage.saveAuth(false)
    }

    // MARK: AuthStateProvider

    var authState: Auth {
        return storage.obtainAuth()
    }
}
