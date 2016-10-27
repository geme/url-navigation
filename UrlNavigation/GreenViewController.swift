//
//  GreenViewController.swift
//  UrlNavigation
//
//  Created by Gerrit Menzel on 27.10.16.
//  Copyright © 2016 geme. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController, ViewModelBindable {

    var viewModel: ViewControllerViewModel? {
        didSet {
            title = viewModel?.title
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green

        self.view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }

    lazy var button: UIButton = {
        let b = UIButton()
        b.setTitle("goto blue", for: .normal)
        b.addTarget(self, action: #selector(redTouchUpInside), for: .touchUpInside)
        return b
    }()


    func redTouchUpInside(sender: UIButton) {
        UIApplication.open(scheme: "blue?title=bar")
    }
}
