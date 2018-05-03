import Foundation

enum CEDeepLinkOption: DeepLinkOption {

    case itemCreation

    static func build(with dict: [String : AnyObject]?) -> DeepLinkOption? {
        return nil
    }

    static func build(with userActivity: NSUserActivity) -> DeepLinkOption? {
        return nil
    }
}
