//
//  SwiftMessagesInterface.swift
//

import UIKit
import SwiftMessages
import AFNetworking

@objc enum ToastType: Int {
    case topStatusBar   = 0
    case topCard        = 1
    case bottomCard     = 2
}

@objc class SwiftMessagesInterface: NSObject {

    // MARK: - Bundle available

    @objc class func showNotificationToast(sender            : UIViewController,
                                           customMessageView : MessageView?,
                                           title             : String,
                                           subtitle          : String,
                                           placeholderImage  : UIImage?,
                                           imageURL          : String?,
                                           toastType         : ToastType,
                                           showDropShadow    : Bool,
                                           backgroundColor   : UIColor,
                                           foregroundColor   : UIColor,
                                           duration          : TimeInterval,
                                           handler           : (() -> Void)?) {

        // Customization of SwiftMessages configuration
        var messageViewConfig       = SwiftMessages.Config()
        messageViewConfig.duration  = .seconds(seconds: duration)

        // Toast view configuration
        switch toastType {
        case .topStatusBar:
            messageViewConfig.presentationContext      = .window(windowLevel: .statusBar)
            messageViewConfig.preferredStatusBarStyle  = .lightContent
        case .bottomCard:
            messageViewConfig.presentationContext      = .window(windowLevel: .normal)
            messageViewConfig.presentationStyle        = .bottom
            messageViewConfig.preferredStatusBarStyle  = sender.preferredStatusBarStyle
        default:
            messageViewConfig.presentationContext      = .window(windowLevel: .statusBar)
            messageViewConfig.presentationStyle        = .top
            messageViewConfig.preferredStatusBarStyle  = sender.preferredStatusBarStyle
        }

        // Toast view initilization
        var messageView: MessageView

        if let customMessageView = customMessageView {
            messageView = customMessageView
        } else {
            if toastType == .topStatusBar {
                messageView = MessageView.viewFromNib(layout: .statusLine)
            } else {
                messageView = MessageView.viewFromNib(layout: .cardView)
            }
        }

        // Toast gestures
        let swipeGesture        = UISwipeGestureRecognizer()
        swipeGesture.direction  = toastType == .bottomCard ? .down : .up
        swipeGesture.addTarget(self, action: #selector(swipeAction))
        messageView.addGestureRecognizer(swipeGesture)

        if let handler = handler {
            messageView.tapHandler = { _ in
                handler()
                SwiftMessages.hide()
            }
        } else {
            messageView.tapHandler = { _ in
                SwiftMessages.hide()
            }
        }

        // Set content and style
        messageView.configureContent(title: title, body: subtitle)
        messageView.configureTheme(backgroundColor  : backgroundColor,
                                   foregroundColor  : foregroundColor,
                                   iconImage        : placeholderImage,
                                   iconText         : nil)
        messageView.layer.cornerRadius = 3.0
        messageView.button?.isHidden = true

        if let iconImageView = messageView.iconImageView,
           let iconURLString = imageURL,
           !iconURLString.isEmpty,
           let iconUrl = URL(string: iconURLString) {
                iconImageView.setImageWith(iconUrl, placeholderImage: placeholderImage)
        }

        if showDropShadow {
            messageView.configureDropShadow()
        }

        // Display Toast
        SwiftMessages.show(config: messageViewConfig, view: messageView)
    }

    @objc class func showNotificationToast(configuration: ProductToastConfiguration,
                                           sender       : UIViewController,
                                           handler      :(() -> Void)?) {
        var customMessageView   : MessageView?,
            placeholderImage    : UIImage?,
            imageUrl            : String?,
            dropShadow          = false

        if let cardConfiguration = configuration as? CardProductToast {
            let bundle          = Bundle(for: self)
            placeholderImage    = UIImage(named         : cardConfiguration.placeholderImageName,
                                          in            : bundle,
                                          compatibleWith: nil)
            imageUrl            = cardConfiguration.placeholderImageName
            dropShadow          = cardConfiguration.dropShadow
            customMessageView   = cardConfiguration.customMessageView
        }

        SwiftMessagesInterface.showNotificationToast(sender             : sender,
                                                     customMessageView  : customMessageView,
                                                     title              : configuration.title,
                                                     subtitle           : configuration.subtitle,
                                                     placeholderImage   : placeholderImage,
                                                     imageURL           : imageUrl,
                                                     toastType          : configuration.toastType,
                                                     showDropShadow     : dropShadow,
                                                     backgroundColor    : configuration.backgroundColor,
                                                     foregroundColor    : configuration.foregroundColor,
                                                     duration           : configuration.duration,
                                                     handler            : handler)
    }

    // MARK: - Private

    @objc private func swipeAction() {
        SwiftMessages.hide()
    }
}
