//
//  BlueViewController.swift
//  UrlNavigation
//
//  Created by Gerrit Menzel on 27.10.16.
//  Copyright © 2016 geme. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController, UrlBindable {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
    }

    func bind(url: URL) {
        title = url.queryItems?["title"]
    }
}
