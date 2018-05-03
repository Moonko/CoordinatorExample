import Foundation

public protocol DeepLinkOption {

    static func build(with userActivity: NSUserActivity) -> DeepLinkOption?
    static func build(with dict: [String: AnyObject]?) -> DeepLinkOption?
}
