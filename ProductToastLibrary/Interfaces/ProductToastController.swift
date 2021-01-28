//
//  UIView .swift
//  ProductToastLlibrary
//
//  Created by Benjamin Nardin on 27/01/2021.
//

import UIKit

@objc public class ProductToastHelper: NSObject {

    //MARK: - Public

    @objc public class func showSuccessCard(sender: UIViewController, handler: (() -> Void)? = nil) {

        SwiftMessagesInterface.showNotificationToast(configuration: ToastConfiguration.SuccessCard(),
                                                     sender       : sender,
                                                     handler      : handler)

    }

    //An error message should be passed to be displayed
    @objc public class func showErrorCard(sender        : UIViewController,
                                          errorMessage  : String,
                                          handler       : (() -> Void)? = nil) {

        let configuration = ToastConfiguration.ErrorCard()
        configuration.subtitle = errorMessage
        SwiftMessagesInterface.showNotificationToast(configuration: configuration,
                                                     sender       : sender,
                                                     handler      : handler)

    }

    @objc public class func showWarningCard(sender: UIViewController, handler: (() -> Void)? = nil) {

        SwiftMessagesInterface.showNotificationToast(configuration: ToastConfiguration.WarningCard(),
                                                     sender       : sender,
                                                     handler      : handler)

    }

    @objc public class func showSuccessStatusBar(sender: UIViewController, handler: (() -> Void)? = nil) {

        SwiftMessagesInterface.showNotificationToast(configuration: ToastConfiguration.SuccessStatusBar(),
                                                     sender       : sender,
                                                     handler      : handler)

    }

    @objc public class func showErrorStatusBar(sender: UIViewController, handler: (() -> Void)? = nil) {

        SwiftMessagesInterface.showNotificationToast(configuration: ToastConfiguration.ErrorStatusBar(),
                                                     sender       : sender,
                                                     handler      : handler)

    }
}
