//
//  RedViewController.swift
//  UrlNavigation
//
//  Created by Gerrit Menzel on 27.10.16.
//  Copyright © 2016 geme. All rights reserved.
//

import UIKit

class RedViewController: UIViewController, ViewModelBindable {

    var viewModel: ViewControllerViewModel? {
        didSet {
            title = viewModel?.title
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
}
