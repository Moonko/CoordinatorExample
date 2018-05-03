protocol AuthViewModel: class {

    typealias AuthBlock = () -> Void

    func auth(_ onFinish: AuthBlock?)
}

final class AuthViewModelImpl: AuthViewModel {

    var authService: AuthService!

    func auth(_ onFinish: AuthBlock?) {
        authService.auth()
        onFinish?()
    }
}
