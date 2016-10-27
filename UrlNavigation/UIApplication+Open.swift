//
//  UIApplication+Open.swift
//  UrlNavigation
//
//  Created by Gerrit Menzel on 27.10.16.
//  Copyright © 2016 geme. All rights reserved.
//

import UIKit

extension UIApplication {
    static func open(url: URL) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
