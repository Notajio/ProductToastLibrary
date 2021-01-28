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
        let title                           = "card_success_title".localized
        let subtitle                        = "card_success_subtitle".localized
        let toastType                       = ToastType.topCard
        let backgroundColor                 = UIColor.yellow
        let foregroundColor                 = UIColor.black
        let duration                        = 5.0
        let dropShadow                      = false
        let imageUrl                        = "https://i.ibb.co/zhdDDWc/check.png"
        let placeholderImageName            = "placeholder_image"
        let customMessageView: MessageView? = nil
    }

    final class ErrorCard: CardProductToast {
        let title                           = "card_error_title".localized
        var subtitle                        = "card_error_default_subtitle".localized
        let toastType                       = ToastType.topCard
        let backgroundColor                 = UIColor.yellow
        let foregroundColor                 = UIColor.black
        let duration                        = 5.0
        let dropShadow                      = false
        let imageUrl                        = "https://i.ibb.co/ZXPMx83/close.png"
        let placeholderImageName            = "placeholder_image"
        let customMessageView: MessageView? = nil
    }

    final class WarningCard: CardProductToast {
        let title                           = "card_warning_title".localized
        let subtitle                        = "card_warning_subtitle".localized
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
        let title               = "status_success_title".localized
        let subtitle            = "status_success_subtitle".localized
        let toastType           = ToastType.topStatusBar
        let backgroundColor     = UIColor.green
        let foregroundColor     = UIColor.white
        let duration            = 3.0
    }

    final class ErrorStatusBar: StatusBarToast {
        let title               = "status_error_title".localized
        let subtitle            = "status_error_subtitle".localized
        let toastType           = ToastType.topStatusBar
        let backgroundColor     = UIColor.red
        let foregroundColor     = UIColor.white
        let duration            = 3.0
    }
}
