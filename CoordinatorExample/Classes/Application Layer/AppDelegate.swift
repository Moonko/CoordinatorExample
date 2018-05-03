import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private lazy var appCoordinator: Coordinator = makeAppCoordinator()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    ) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let notification = launchOptions?[.remoteNotification] as? [String: AnyObject]
//        Replace this line with the following one to check deep link
        let deepLink = CEDeepLinkOption.build(with: notification)
//        let deepLink = CEDeepLinkOption.itemCreation
        appCoordinator.start(with: deepLink)
        window?.makeKeyAndVisible()

        return true
    }

    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        let dict = userInfo as? [String: AnyObject]
        let deepLink = CEDeepLinkOption.build(with: dict)
        appCoordinator.start(with: deepLink)
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        let deepLink = CEDeepLinkOption.build(with: userActivity)
        appCoordinator.start(with: deepLink)
        return true
    }
}
