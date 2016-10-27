//
//  SchemeLookupTable.swift
//  UrlNavigation
//
//  Created by Gerrit Menzel on 27.10.16.
//  Copyright © 2016 geme. All rights reserved.
//

import UIKit

struct SchemeLookupTable: ViewControllerLookupTable {

    fileprivate
    let viewControllers: [String: () -> UIViewController] = [
        "red": RedViewController.init,
        "green": GreenViewController.init,
        "blue": BlueViewController.init
    ]

    func viewController(for string: String) -> UIViewController? {
        return viewControllers[string]?()
    }

}
