//
//  ToastConfiguration.swift
//

import UIKit
import SwiftMessages

/*
 Defines protocols for mandatory items in Toast configuration and content
 Protocols made unavailable outside the framework to prevent creation of configurations
 that are not included in the product specification
 */
@objc protocol ProductToastConfiguration {
    var title            : String       {get}
    var subtitle         : String       {get}
    var toastType        : ToastType    {get}
    var backgroundColor  : UIColor      {get}
    var foregroundColor  : UIColor      {get}
    var duration         : TimeInterval {get}
}

@objc protocol CardProductToast: ProductToastConfiguration {
    var dropShadow          : Bool          {get}
    var placeholderImageName: String        {get}
    var imageUrl            : String        {get}
    var customMessageView   : MessageView?  {get}
}

protocol StatusBarToast: ProductToastConfiguration {
}

//Implementation of protocols with default values resquired in the product specification
struct ToastConfiguration {

    final class SuccessCard: CardProductToast {
        let title                           = "Success"
        let subtitle                        = "This is a success alert"
        let toastType                       = ToastType.topCard
        let backgroundColor                 = UIColor.green
        let foregroundColor                 = UIColor.black
        let duration                        = 5.0
        let dropShadow                      = false
        let imageUrl                        = "https://i.ibb.co/zhdDDWc/check.png"
        let placeholderImageName            = "placeholder_image"
        let customMessageView: MessageView? = nil
    }

    final class ErrorCard: CardProductToast {
        let title                           = "Oops!"
        var subtitle                        = "An error occurred"
        let toastType                       = ToastType.topCard
        let backgroundColor                 = UIColor.red
        let foregroundColor                 = UIColor.black
        let duration                        = 5.0
        let dropShadow                      = false
        let imageUrl                        = "https://i.ibb.co/ZXPMx83/close.png"
        let placeholderImageName            = "placeholder_image"
        let customMessageView: MessageView? = nil
    }

    final class WarningCard: CardProductToast {
        let title                           = "Warning"
        let subtitle                        = "This is a warning alert"
        let toastType                       = ToastType.topCard
        let backgroundColor                 = UIColor.orange
        let foregroundColor                 = UIColor.white
        let duration                        = 5.0
        let dropShadow                      = false
        let imageUrl                        = "https://i.ibb.co/zhdDDWc/check.png"
        let placeholderImageName            = "placeholder_image"
        let customMessageView: MessageView? = nil
    }

    final class SuccessStatusBar: StatusBarToast {
        let title               = "Oops!"
        let subtitle            = "Claim code copied!"
        let toastType           = ToastType.topStatusBar
        let backgroundColor     = UIColor.green
        let foregroundColor     = UIColor.white
        let duration            = 3.0
    }

    final class ErrorStatusBar: StatusBarToast {
        let title               = "Success"
        let subtitle            = "Please check your network settings"
        let toastType           = ToastType.topStatusBar
        let backgroundColor     = UIColor.red
        let foregroundColor     = UIColor.white
        let duration            = 3.0
    }
}
