//
//  ViewControllerViewModel.swift
//  UrlNavigation
//
//  Created by Gerrit Menzel on 27.10.16.
//  Copyright © 2016 geme. All rights reserved.
//

import Foundation

struct ViewControllerViewModel: UrlInitable {

    let title: String

    init?(url: URL) {
        guard let dict = url.queryItems else {
            return nil
        }

        if let title = dict["title"] {
            self.title = title
        } else {
            return nil
        }
    }
}
