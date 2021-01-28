//
//  String+Localized.swift
//  ProductToastLibrary
//
//  Created by Benjamin Nardin on 28/01/2021.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
