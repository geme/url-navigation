//
//  UINavigationController+Navigation.swift
//  UrlNavigation
//
//  Created by Gerrit Menzel on 27.10.16.
//  Copyright © 2016 geme. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {

    func navigate(to url: URL, lookupTable: ViewControllerLookupTable) {
        if url.popToRoot {
            self.popViewController(animated: false)
        }

        if let vc = lookupTable.viewController(for: url) {
            self.pushViewController(vc, animated: url.queryItems?["animated"]?.boolValue ?? true)
        }
    }
}

extension URL {
    fileprivate
    var popToRoot: Bool {
        return self.host == nil && self.pathComponents.first == "/"
    }
}

extension String {

    fileprivate
    var boolValue: Bool? {
        if self.lowercased() == "true" || self.lowercased() == "1" {
            return true
        } else if self.lowercased() == "false" || self.lowercased() == "0" {
            return false
        }
        return nil
    }

}

