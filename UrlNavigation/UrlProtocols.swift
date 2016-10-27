//
//  UrlProtocols.swift
//  UrlNavigation
//
//  Created by Gerrit Menzel on 27.10.16.
//  Copyright © 2016 geme. All rights reserved.
//

import Foundation

protocol UrlBindable {
    mutating func bind(url: URL)
}

protocol UrlInitable {
    init?(url: URL)
}

protocol ViewModelBindable: UrlBindable {

    associatedtype T: UrlInitable

    var viewModel: T? { get set }

    mutating func bind(viewModel: T)

}

extension ViewModelBindable {

    mutating func bind(viewModel: T) {
        self.viewModel = viewModel
    }

    mutating func bind(url: URL) {
        if let viewModel = T(url: url) {
            self.bind(viewModel: viewModel)
        }
    }
}
