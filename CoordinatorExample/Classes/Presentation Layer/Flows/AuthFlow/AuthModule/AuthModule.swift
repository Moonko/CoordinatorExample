protocol AuthModule: Presentable {

    typealias Completion = () -> Void

    var onFinish: Completion? { get set }
}
