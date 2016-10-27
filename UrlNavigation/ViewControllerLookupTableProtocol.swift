//
//  ViewControllerLookupTableProtocol.swift
//  UrlNavigation
//
//  Created by Gerrit Menzel on 27.10.16.
//  Copyright © 2016 geme. All rights reserved.
//

import Foundation
import UIKit

protocol ViewControllerLookupTable {
    func viewController(for string: String) -> UIViewController?
    func viewController(for url: URL) -> UIViewController?
}

extension ViewControllerLookupTable {
    func viewController(for url: URL) -> UIViewController? {
        if let host = schemeHost(for: url)?.lowercased(),
            let vc = self.viewController(for: host) {

            if let vc = vc as? UrlBindable {
                var vc = vc
                vc.bind(url: url)
            }

            return vc
        }

        return nil
    }

    fileprivate
    func schemeHost(for url: URL) -> String? {
        if let host = url.host {
            return host
        } else if
            let root = url.pathComponents.first,
            let host = url.pathComponents[safe: 1],
            root == "/" {
            return host
        }
        return nil
    }
}
